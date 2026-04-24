Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D832E134
	for <imx@lists.linux.dev>; Fri, 24 Apr 2026 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777065892; cv=none; b=Hb/itcCXFyJ9BIHPM/8nZ/TSJ/ILlappvZX+88vIUuaLHw4G2ka0bBUG+qw28ChpWqbozDnyQ6vCZT2j06jl+A4qAEqWrlpX0GWXLL/BsHk/B3MKRCotOIDV+IIffciRBMejYzaMvCd9ADpSFOBOau+Eu42s8kOwBZ4v22yP7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777065892; c=relaxed/simple;
	bh=OOvCfNvP/t9snDp0xVHuGAvs/3wkRapGCm8Nkw6btaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGYBy88zLgx4k+eNubTRI/UhQCwygIHNy20bxNdhmZdjsyrVpqShXPdjgIk1dl5Uo8IWDfkOewOtUylE9tKBhPt19OpnZ3szk+5cyr7/wlF6RUZK+VUy89NRoh9umiiBdHzJ3SoULVz9WexBkxlfhZaiHMimJm/LPrNNTzkDMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FQ/jaQ5u; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FQ/jaQ5u"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69486849137so3129235eaf.3
        for <imx@lists.linux.dev>; Fri, 24 Apr 2026 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777065889; x=1777670689; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJNaihlk3IRG5/RkBM+hnzAM1yk0Bb5wvtfDGLFoLmg=;
        b=FQ/jaQ5ugcF1P/6XajMYsunyI6wfLPE46WCYVT9DKpjq5/P7teBKXbWKXCPy+N399W
         gGtopbn0EliWxngv02MbGgQSpktX5DnbTWHiHIuipLxRTpLxGbC1hPg2AjP7wQtGqd4s
         IUXhySIYIO4UzNaFbuW7rOCjX8RAn2LSmTHYHPsLvZ68OtgCdbV7HgZVMmGR+zDsMmeP
         uCHsJuTC0vtjwvEGcsJ0V4nG+9iS5ZkPCVQdze0PgMOUzqMU7UoIsJcYR7oHaq6jCkxv
         hkSa0jaxR8AGcs7iO/+k+4VJIw8wy0EjjUuZPiULVF2kONxQXN5czR18tIJksauTgOvy
         TIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777065889; x=1777670689;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJNaihlk3IRG5/RkBM+hnzAM1yk0Bb5wvtfDGLFoLmg=;
        b=fU5ZpYckwNUoiGTILtiZmLTB/n8jhlpRtV+VLznhSTxELLqc/XVbaXVl4RT+lKHN4m
         Wnet5J6NxeHMk1d2kZ0G2oBEF3+VH4e2MPLJUCo6ktDh1N6os75rurA5O7R09um+650l
         EifJP+iKJwMLUAtH5U5QEFSlKTgPPYr9FGjEyvLeM/yF1ZJaf3WN6n1mM5kbrwWrXat1
         d/5bXH23R/izg/J7Vwpgy4dwZ/p8fiudTltm5MvlKGHeG83as/3m86O6ITgEjpKXp2wM
         VrGu+FX18RDhDm6ivD1yVLTtBQMSMVTYt+1xv7zN3c3zjkVZ7lnviPt5zUo1zBxFukNz
         uF2g==
X-Forwarded-Encrypted: i=1; AFNElJ+sbin/ill83Wlhb03lEC7EmKXnbzsRGxUgMzEU5nNMFUDz1/dKKnnjuGttUnd+Sk9R4+s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxYzcxzOSk4aUdoAmMIGPv4Fivu++fJCetRLNyMTYcUJpypWfS
	/RGCvRrFOQCAxHpJ4McJdO7cpljMT+HbYw0t5Da4HySLz6tasz2j0zrnk767jZgKRw==
X-Gm-Gg: AeBDietw+aLhzZKgkLHz55uvidJz9KbXD/u7I1h0OA0fKOxG0yhIXLjFSHOAaUkOXd7
	c635PINl3WDfNpVIigKUTqY+iNoKb8+J3lPDS0PjBPPfMPlmx2vsVC12hqeGrRVep2wWwAX93Lw
	RAXD3FRSxKSTSy2zyYGsJpLWNbkcn5hAF+IgZ9v/FEIMOfyr4s/NIal1DBb44wafHCaepeaWvIo
	N9RnEgugDKR8wQaG/QXxspW2XUPEzcCPGf66D1nbI78OW54/iRU0wR7yUiFeiruZE049Huhw7NV
	EmCghlwwCKTjUOGG8CRzHvcWVdQqPS4RWO5dExLjBhL6PEV26PRPD0nXYCwTTQuAjEYLBlWnHWo
	1GYOLiSynOQd5yUQ2jm5YypnjNfZ1fDpiTY63C+BBIRYxIbtAd3TzvW/i75r4HXdR1nb45qS5oI
	GL9eLRLjWEfwCk+92XYaDr2CIP5CH8Fe903kGZKY5+x6gQBxFI2rEpnKaI5Dmvr+9cyPp8ppJAV
	8zyQx0WTL7tgvqYnYod
X-Received: by 2002:a05:6820:f026:b0:694:97ca:9ecf with SMTP id 006d021491bc7-69497caa1abmr10550455eaf.31.1777065888893;
        Fri, 24 Apr 2026 14:24:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:8f46:c3fb:92e2:2f40? ([2600:1700:4570:89a0:8f46:c3fb:92e2:2f40])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69489e52aacsm9895971eaf.9.2026.04.24.14.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 14:24:48 -0700 (PDT)
Message-ID: <79039de4-aa33-430c-b004-ae98b2541f63@google.com>
Date: Fri, 24 Apr 2026 14:24:44 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: tcpm: fix debug accessory mode detection
 for sink ports
To: Xu Yang <xu.yang_2@nxp.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 m.grzeschik@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20260424074009.2979266-1-xu.yang_2@nxp.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <20260424074009.2979266-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/24/26 12:40 AM, Xu Yang wrote:
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
> machine transitions comply with Type-C specification. Also update the logic
> in run_state_machine() to keep consistency.
>
> Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Amit Sunil Dhamne <amitsd@google.com>


BR,

Amit

>
> ---
> Changes in v2:
>  - update tcpm_port_is_debug() in run_state_machine() as well
>    as suggested by Amit
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index dfbb94ddc98a..6d258efae6f0 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
>  	 (tcpm_cc_is_source((port)->cc2) && \
>  	  !tcpm_cc_is_source((port)->cc1)))
>  
> +#define tcpm_port_is_debug_source(port) \
> +	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
> +
> +#define tcpm_port_is_debug_sink(port) \
> +	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> +
>  #define tcpm_port_is_debug(port) \
> -	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
> -	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> +	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
>  
>  #define tcpm_port_is_audio(port) \
>  	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> @@ -5176,7 +5181,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK);
>  		break;
>  	case SRC_ATTACH_WAIT:
> -		if (tcpm_port_is_debug(port))
> +		if (tcpm_port_is_debug_source(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       port->timings.cc_debounce_time);
>  		else if (tcpm_port_is_audio(port))
> @@ -5434,7 +5439,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
>  		break;
>  	case SNK_ATTACH_WAIT:
> -		if (tcpm_port_is_debug(port))
> +		if (tcpm_port_is_debug_sink(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
>  		else if (tcpm_port_is_audio(port))
> @@ -5454,7 +5459,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (tcpm_port_is_disconnected(port))
>  			tcpm_set_state(port, SNK_UNATTACHED,
>  				       PD_T_PD_DEBOUNCE);
> -		else if (tcpm_port_is_debug(port))
> +		else if (tcpm_port_is_debug_sink(port))
>  			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>  				       PD_T_CC_DEBOUNCE);
>  		else if (tcpm_port_is_audio(port))
> @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  
>  	switch (port->state) {
>  	case TOGGLING:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> -		else if (tcpm_port_is_sink(port))
> +		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case CHECK_CONTAMINANT:
> @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		break;
>  	case SRC_UNATTACHED:
>  	case ACC_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_source(port))
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> +		else if (tcpm_port_is_debug_sink(port))
> +			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
>  	case SRC_ATTACH_WAIT:
>  		if (tcpm_port_is_disconnected(port) ||
> @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  		}
>  		break;
>  	case SNK_UNATTACHED:
> -		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
> +		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
>  		    tcpm_port_is_sink(port))
>  			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
>  		break;
