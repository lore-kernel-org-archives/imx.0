Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C2EEBB
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776984657; cv=none; b=oEDtcEKZoVLu28Et+2W3ruSJ2uvFS/0+5i+x7SVKPR5CapdBI+2RbWfyijQlFDrTcpwkwRP1Hl1smP+qalsmgUInvrMQTCMV2uuTG8gUJRurKty3wIUuMMjkVDPfhfMrB05rZ36/MDnEmkAo9OQmKhc7cnwjIM6VQ9toHgYgSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776984657; c=relaxed/simple;
	bh=sBD6hfqqD5vDkj/PJwKkm6tZsvxEyPBUfmc+YlBlfto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea1a9c0Y+tx3WtPBvWgdje0b2lBJLHxim13TD8oawGW6cqIOZCvfm9A0Xd76FuPD6Mm9Dw/JXKj8T/8KKociRF1OPy4TE9Mf38TWSJeSi0HXtbck6vd/08tLenCjR2uMQVGMCCeLSKzWmwe34pFaWK4EVcv1wswen2ZWC0MAWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rka24Kb9; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rka24Kb9"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so11536311eec.1
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 15:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776984654; x=1777589454; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMXf2gnDkRB+s69+bOFp0A+RG1TpxXUu3x/474wh+4M=;
        b=Rka24Kb9PmAHG/46hTfQHdqXxj6tE26n/k7+Cm27RonegN5kZW1VwSYZAFnmYu3KOv
         gJ4BxvGfkyo4Hm0ID4NhHIlMhd2RPuM/LOlROG1scgIurLZrZoYs/Kxi5+jL5jg/vHeE
         jbzCyljgTVukhrOAoLfsPGNdbfIeV2gVQyrDje8/gfvfjuyLfY4uGLp6zY+FXjQUzVxh
         AO+g6CDPC8NoacZPRKJRHv2jFrmIjzcj3abdSE1ZxLI9dNo0bNpDkb4RIcDWFm7VF+h5
         jWB4ezTIW8DHrpQqTtUrtudYXI5UWomE6gURr4cJ2+Ubzc1UN5cxzNzSPmUaY/Cp0sR4
         mbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776984654; x=1777589454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMXf2gnDkRB+s69+bOFp0A+RG1TpxXUu3x/474wh+4M=;
        b=EEbrpoOW41oE4GTQayuHPjJB5kNl+CB72/RD2MLRXxIsWBxDCgavN7H5HrjHenTtUm
         GjLXSa7C1U9/eaXrMTHOWnOoaa7hFdJkB/G7t+VLlGrTBEXqGePUv5iYHhUFD4PoSqLu
         jpfJIXtbsNYpAZa1Ym+rYt98ieltXlJzdDRArt7AtQDNuoOX6LgSmzNoKISfzll9s7e5
         6Q5WtN1Zz5eRV1r+4xYPFKd4Adxscn1Dq8/M7h6fZ2CyvIf/q70GMknMwSnGDroXQ/v8
         6WrHgBZNYFUd8JxPAeuUVJDAXT+79g51P9HcLS4Hu33knce1PGwyPnCNU6xUhbbF7Vj2
         BaqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AhEaGHQHahQiDlny4pYlmXt3yNN6wKUls2dr7/JVeBM95DJxYNgMo5k86fpXZ+kMeo8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzByk+TSOp7NzN/IVjaUkgwqLTJKCNQc8WyPwI8rDgxojbEGaTp
	qt+J2MSKuuN3X++TAroHu07jZTL3xLLFxH+q3qdZFdXnc3qWcAJeO76SdPjFnzchHw==
X-Gm-Gg: AeBDiesSGRKUfZtv2aStbs8TQr5lkTAeKhmEIg3Z6qclVRacXIRg7tsr8ZdFb/qBJeE
	7kba2MupR8sYTFXajfHtw9jvZ3LJewgpMaMZDYc28JSrsG+8h9vCG/n3NLgEJA9Pwl6I+4Y1PtL
	SaPyZ8msj719j2XfB6WFloxtW2CTBiF5o12KEhxPimE5xgzJWSVJOYSlZFf3DsBUuTap+d9Ypeo
	aEPynaLxWKpGzg4jh400BJH7f4LpmcS9rRM3UUOE3qGOr6XCCVQ5kmTEaN+T0kkWvqFULupJXi7
	qFroLbCRMtoYiwgCGQmn4/LHt94uvxrybe5VMVA3WB7PKfvLyJsCqDgU6HbgKtVmmP3b+jl/ZxI
	UZRKc9uLpTLWtCmMvdrTTkRTR+G0mSwH5in4feMqyFpO7vnHPjCAhZr+nNDk4NPpj9BlS/M4Mza
	UZKD2JS+LH5T8Eo0lAdnl6xL90oqhWmDN/rSRMMfLcx9CFL4DrFpgD72XwKkPe8jg+jhLqIROZt
	GVjFtvUkReTnlIU+oMyfmDXW9vYVGi+TQn8xO3wli24s0w=
X-Received: by 2002:a05:7301:1f01:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2e4657714d1mr15215495eec.12.1776984653739;
        Thu, 23 Apr 2026 15:50:53 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:5cd3:e624:64db:3649? ([2a00:79e0:2e7c:8:5cd3:e624:64db:3649])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm28541858eec.23.2026.04.23.15.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 15:50:53 -0700 (PDT)
Message-ID: <d9f89db5-e2be-4326-b57a-c8213eea675a@google.com>
Date: Thu, 23 Apr 2026 15:50:51 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: fix debug accessory mode detection for
 sink ports
To: Xu Yang <xu.yang_2@nxp.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 m.grzeschik@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20260420030317.425022-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260420030317.425022-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xu,

On 4/19/26 8:03 PM, Xu Yang wrote:
> The port in debug accessory mode can be either a source or sink. The
> previous tcpm_port_is_debug() function only checked for source port.
>
> Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
> accessory mode debug") changed the detection logic to support both roles,
> but left some logic in _tcpm_cc_change() unchanged, This causes the state
> machine to transition to an incorrect state when operating as a sink in
> debug accessory mode. Log as below:
>
> [  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> [  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACHED @ 180 ms [rev1 NONE_AMS]
> [  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarity 0, connected]
> [  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
>
> It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.
>
> To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sink()
> helper to explicitly identify the power mode in debug accessory mode.
> Update the state transition logic in _tcpm_cc_change() to ensure the state
> machine transitions comply with Type-C specification.
>
> Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index dfbb94ddc98a..1ee00025de56 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
>   	 (tcpm_cc_is_source((port)->cc2) && \
>   	  !tcpm_cc_is_source((port)->cc1)))
>   
> +#define tcpm_port_is_debug_source(port) \
> +	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> +
> +#define tcpm_port_is_debug_sink(port) \
> +	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> +
>   #define tcpm_port_is_debug(port) \
> -	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> -	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> +	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
>   
>   #define tcpm_port_is_audio(port) \
>   	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>   
>   	switch (port->state) {
>   	case TOGGLING:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>   		    tcpm_port_is_source(port))
>   			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> -		else if (tcpm_port_is_sink(port))
> +		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
>   			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>   		break;
>   	case CHECK_CONTAMINANT:
> @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>   		break;
>   	case SRC_UNATTACHED:
>   	case ACC_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>   		    tcpm_port_is_source(port))
>   			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> +		else if (tcpm_port_is_debug_sink(port))
> +			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>   		break;
>   	case SRC_ATTACH_WAIT:
>   		if (tcpm_port_is_disconnected(port) ||
> @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>   		}
>   		break;
>   	case SNK_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
>   		    tcpm_port_is_sink(port))
>   			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>   		break;


Thanks for submitting the patch.

Please can you also add changes in run_state_machine()? I think we can 
replace tcpm_port_is_debug() in SNK_ATTACH_WAIT case with 
tcpm_port_is_debug_sink(). Also, similar changes for SRC_ATTACH_WAIT case.


BR,

Amit

