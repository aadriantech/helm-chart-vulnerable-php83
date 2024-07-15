{{/*
    Expand the name of the chart.
    */}}
    {{- define "capstone-chart-vulnerable-php83.name" -}}
    {{- default .Chart.Name (default "" .Values.nameOverride) | trunc 63 | trimSuffix "-" }}
    {{- end }}
    
    {{/*
    Create a default fully qualified app name.
    We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
    If release name contains chart name it will be used as a full name.
    */}}
    {{- define "capstone-chart-vulnerable-php83.fullname" -}}
    {{- if (default "" .Values.fullnameOverride) }}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
    {{- else }}
    {{- $name := default .Chart.Name (default "" .Values.nameOverride) }}
    {{- if contains $name .Release.Name }}
    {{- .Release.Name | trunc 63 | trimSuffix "-" }}
    {{- else }}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
    {{- end }}
    {{- end }}
    {{- end }}
    
    {{/*
    Create chart name and version as used by the chart label.
    */}}
    {{- define "capstone-chart-vulnerable-php83.chart" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
    {{- end }}
    
    {{/*
    Common labels
    */}}
    {{- define "capstone-chart-vulnerable-php83.labels" -}}
    helm.sh/chart: {{ include "capstone-chart-vulnerable-php83.chart" . }}
    {{ include "capstone-chart-vulnerable-php83.selectorLabels" . }}
    {{- if .Chart.AppVersion }}
    app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
    {{- end }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    {{- end }}
    
    {{/*
    Selector labels
    */}}
    {{- define "capstone-chart-vulnerable-php83.selectorLabels" -}}
    app.kubernetes.io/name: {{ include "capstone-chart-vulnerable-php83.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    {{- end }}
    
    {{/*
    Create the name of the service account to use
    */}}
    {{- define "capstone-chart-vulnerable-php83.serviceAccountName" -}}
    {{- if .Values.serviceAccount.create }}
    {{- default (include "capstone-chart-vulnerable-php83.fullname" .) (default "" .Values.serviceAccount.name) }}
    {{- else }}
    {{- default "default" (default "" .Values.serviceAccount.name) }}
    {{- end }}
    {{- end }}
    