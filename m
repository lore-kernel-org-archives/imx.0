Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EEA24678F
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031616; cv=none; b=dtYH3WXGLSQfG5+FOzHNTsY7/yW78aq6+2/ngTM5TeueHl8fkpDzpbjp+vgloYhHCbleqktYhzuelb728SiJzJaMXZAi/89X4PQuMlj2O8RCVK2yT8mvrEd2q4D/BlBP0SxCUc6DlV09ggSt3G5iH2aM5xCGmHpnO6wJq3mT904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031616; c=relaxed/simple;
	bh=8fNE3NX1DUD2apr4HvgC0SPEdbANrnlUs0eoTh5oeGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxwLSsd0nbNS0d1FmaDlvaXCsg5xRpUMZzDFmRnVFQDIlZ1QWq+BmM/Xudn0OCBrZk2AtQkJsjg+loYw7ec0dQp83QPTCZkSpEwDXKw+L+gvhU1K3MzTLbyvReNFX8WN7qu8sa926QjB0JeKwCplDbmyFgC3OMToUELxnFc+sLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UcsjzlrZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UcsjzlrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761031613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJDvXzMxMi1pDcKxo2a9jJgMq2W5icRpzq+zghF2eEk=;
	b=UcsjzlrZWP3ufrKMor2LAbQQw1a4afoFb6en2t/aSd8r++azVRGPZkjOZeXijV2w1NIBQN
	ZY1wb5DaqE/gxSwIasDG5bqIUvXLAtSFeQmbaORA5RGXxCaA0escpCpTdHCA8HuGOQzcWO
	GxhCZHLtQHdp9Qhr/DGnjQeO0AjhnJ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-HYcapH6kPuaRQBclbTg_7A-1; Tue, 21 Oct 2025 03:26:52 -0400
X-MC-Unique: HYcapH6kPuaRQBclbTg_7A-1
X-Mimecast-MFC-AGG-ID: HYcapH6kPuaRQBclbTg_7A_1761031611
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so16385505e9.1
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 00:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761031611; x=1761636411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJDvXzMxMi1pDcKxo2a9jJgMq2W5icRpzq+zghF2eEk=;
        b=kAo3G+4qcxKEceFlfOgwu7Q11aAm8CHSMDtjVq7n8oOMqKptppeiqhnJQgtXUP61YM
         iLDIKa0wi7hcxD6VmwFTR0PyDbzhgBkkiFZYUWzquSDEvQN/bWv5b4Ry2Dz7VwdP6S/z
         UT3LdjV69oQRwfCLWH9TKDJhZkMKuv+rt+rmdtoij5oBzzUhFOH1NuBFiwS6KlBgw8Ls
         XIrn9JHuH8fdkdXbQVbaRQmEcAgrv87xQPp4mLQdfIB5i5ZetZtJZh0n82M20vBVmPSf
         4jbIe2l0k/qLP3DYJz/nxTTuOwqEmRKeojqnVGZ2fmSZeuR27IEycbnSbxuZ/xGHi3wB
         JANg==
X-Gm-Message-State: AOJu0YwXsvtYhYLnrXWc56cdaQlkhqzJmFJjb8G7+Ti13PB3zIBO464m
	SOHyMbGSYq10AGZ9QEhF2WnpdLXD0uwx9TV8DIE3jyBq5WesW7qDs620tbuTOyO1BdY5fH4Qo+N
	iQauFqicX3k/0TnL2+UGfO61CGRcUQFBqPJtT5yh/uZuStdoZWkxI9A==
X-Gm-Gg: ASbGncte8zVASC/Pi1JzV1vyHliEuC4MJwmM2VCEmpyDI/80NlZaiXihRBFrEoTmqH7
	F6IFFm+evUfSlD8dpQSVHKJWcIM+3UihTBVo7Ll3au+kzDul25ukQXoAc0oudPhNVeuRuSy//bj
	WtySMY+f7v9XFKQe0ZONJaEhDJymkH+HQiSXsoo73B6yf/1jyik4z2Y7i+zFZ6XqasptGkUBBP2
	1nu4FfKAphidmioDay5qoha36Kjzrlaz7EeZ1lMBV3dreavADRrutUyq8bPX18E7e9PU399dQF3
	gbcses+p/D+rnAUrsW2VDIwohWNOGw/f8hTN7tbZJKLghpEZbKAQ1uDlqFmKGzd9aJ8JWGiS/Wi
	tcobLVG9MbCzpVDDsTpsCwcBGdThAaoxFP7C2EB7OyvkH9ns=
X-Received: by 2002:a05:600c:540c:b0:471:12be:743 with SMTP id 5b1f17b1804b1-471178a3f93mr118161475e9.15.1761031610902;
        Tue, 21 Oct 2025 00:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkWSWmUORa+H15T+v49lrEDk0detT0U6yn7DgHaIoUivTMeJ3869JPfks9PXOdp64Mjfcqeg==
X-Received: by 2002:a05:600c:540c:b0:471:12be:743 with SMTP id 5b1f17b1804b1-471178a3f93mr118161325e9.15.1761031610532;
        Tue, 21 Oct 2025 00:26:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d916sm176481805e9.4.2025.10.21.00.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:26:49 -0700 (PDT)
Message-ID: <11ffb7d0-4e52-496e-84c7-0d93bf03e4cf@redhat.com>
Date: Tue, 21 Oct 2025 09:26:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/8] net: enetc: add basic support for the ENETC
 with pseudo MAC for i.MX94
To: Wei Fang <wei.fang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
 xiaoning.wang@nxp.com, Frank.Li@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 richardcochran@gmail.com
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251016102020.3218579-1-wei.fang@nxp.com>
 <20251016102020.3218579-7-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251016102020.3218579-7-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6lALYjzw6WbfSK8HzZoEIC2X5BDQuUz4z9B1vKXRadc_1761031611
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/25 12:20 PM, Wei Fang wrote:
> @@ -635,28 +649,10 @@ static void enetc4_pl_mac_config(struct phylink_config *config, unsigned int mod
>  
>  static void enetc4_set_port_speed(struct enetc_ndev_priv *priv, int speed)
>  {
> -	u32 old_speed = priv->speed;
> -	u32 val;
> -
> -	if (speed == old_speed)
> -		return;
> -
> -	val = enetc_port_rd(&priv->si->hw, ENETC4_PCR);
> -	val &= ~PCR_PSPEED;
> -
> -	switch (speed) {
> -	case SPEED_100:
> -	case SPEED_1000:
> -	case SPEED_2500:
> -	case SPEED_10000:
> -		val |= (PCR_PSPEED & PCR_PSPEED_VAL(speed));
> -		break;
> -	case SPEED_10:
> -	default:
> -		val |= (PCR_PSPEED & PCR_PSPEED_VAL(SPEED_10));
> -	}
> +	u32 val = enetc_port_rd(&priv->si->hw, ENETC4_PCR);
>  
>  	priv->speed = speed;
> +	val = u32_replace_bits(val, PCR_PSPEED_VAL(speed), PCR_PSPEED);
>  	enetc_port_wr(&priv->si->hw, ENETC4_PCR, val);
>  }

The above chunk looks unrelated from the rest of this patch. Perhaps
worth moving to a separate patch in this series? Or add some comments
explaining why it's needed.

Thanks,

Paolo

