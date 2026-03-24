Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18DC26ACC
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340028; cv=none; b=qeg1HWojhp7UUKN0hEZn4oOCi658tZ/epcAabUPrcdz6nMPKi3bdvpjWOsHx/4wPxyVzi9EED2iUABL7iLUWy8FYeUMWLgFZQ7k1mAFkmBc6dWwTgF2iR7aay79+aUlPphrFFGLIdwfWnpADGsUohL6UYVWftnn96aiMYotYchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340028; c=relaxed/simple;
	bh=iNaf9eBN6ctYm3Zb4iv7+Xg3CD88VXO0Qx3TRMXdTrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxEsW2EHbEx0ChvYC0z2Z4IERMRHhlsMLyJY6MJo7kqkJduZUntJQcmUgRHS1+cv59/wr1StNGxfEdVTTtrqVYeGrrVIAi/9R+Z4tolKmNGsV8swFwDPRRj7gfmG+40Na2AQpNNbOF2D9UnVowBcfcXbAZtRZA7gofNAavmnw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h3v48IdG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h3v48IdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774340019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
	b=h3v48IdG12BPdeXBmfK8U7izwh3KaFLtxSShFRDNWOqLmYt04jggKQkKeCFzEa+s3DB3Dt
	s0+FCAI3xEOaQbenBlKzTNdMn8tf2X8KJojPyvLcT0T/eIEsXOniYI8qd/5qbfoe2ZE4c6
	p3QvKCtqNRtU8dq2KD0wwl11PhC9pVY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-3Y9lwet1OxqIicvUqHdbAw-1; Tue, 24 Mar 2026 04:13:37 -0400
X-MC-Unique: 3Y9lwet1OxqIicvUqHdbAw-1
X-Mimecast-MFC-AGG-ID: 3Y9lwet1OxqIicvUqHdbAw_1774340016
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-439bab2d095so3756513f8f.3
        for <imx@lists.linux.dev>; Tue, 24 Mar 2026 01:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340016; x=1774944816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
        b=mboZYwgn3e/Jo5ONUboJm1RdT6+xUFJsk5BHEjNxAMyouPTyBllz06006DsiNX1Ayl
         az1Vgi3EPcqQdiPv+7hnKCSIMkcI/dOk/Q98Ng7u5HUJVxK4p48X1Buaa5AsSv+xDbkY
         qf2225oMwAiRlyhDkLpGaSArs5V2GAbGu/+iiEo2K6UlRH7ZVn2Kry08yyaAOlKTDXjX
         fB1qisNISq4oyE7mml7fRuJb0Qqmgu5qiwUHCLsTH6xqecrMBpH2FRE7GZRApJ2NXPnk
         k0kXx2nm7iSjCPdqQBcxsP5hQA9XWFqL6gHUGCGfWxu11qLn5E1Jtvot1soIMt8wcI9d
         Fe6g==
X-Forwarded-Encrypted: i=1; AJvYcCXP7zUTlAJco2RIVrXK0gwtwNoeBDkcqXL89kxYclbOxBFlueKmqLSo842ynt9bBMx3aW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHD2C3m1egDBu4vdxBObAllRg+mL3KtF6/7Tz2L9U1JcCfs0zU
	riJO3HQSChYWcft5In2YAGWLa/JCkESwOwVW448jAnHa2Ix8KF+suYDt+oN9CxbNQEvnWY3M9u+
	4Xc5lnOd8xpmVoiQIR9Wy2SgtvlxSqrjPGw3dDTaxQLXqdB/JPzaBLQ==
X-Gm-Gg: ATEYQzxLbpaV/wTj60HHxlfDaqjeQnqONCWC5PxYWHPnKxJHzti4xOYcyAr17BR1Xfm
	abNkDgAqhPzgODZ/fB+YnD+kirRHUO+v79sGoFo0+6JrM4cJJy+sh7/OhT9BAjTYWzpRg8btvxh
	Kg+N7p5Nqpw4cfL7o0Z5cgavLlD0wrcvuNEYQR4rSINGb1qXTP3cERpNF6Hq1ncvYrG0v7/maXJ
	NyFEDV+KAWR6wz8NAJyGV/lluW0vHQ9WY7hxOL9yOitxnyH35X4NS/uh1acmwGjY5IqOCesUN12
	9VonksHffFQDUSUFn86gNv3rbjwy2gXxfWfyzP6Os1zypTOUt/LZtGUkJg0rwn4STOZaoedRP4D
	7slQd4Cq7LRfNSofyCzDklJnNsw8UG629T0dKgOXnAUANr0Rc9WyEmAMG
X-Received: by 2002:a05:6000:4382:b0:43b:3e40:222d with SMTP id ffacd0b85a97d-43b64244451mr22895138f8f.19.1774340015827;
        Tue, 24 Mar 2026 01:13:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4382:b0:43b:3e40:222d with SMTP id ffacd0b85a97d-43b64244451mr22895104f8f.19.1774340015382;
        Tue, 24 Mar 2026 01:13:35 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm35875560f8f.1.2026.03.24.01.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:13:34 -0700 (PDT)
Message-ID: <c4e3c49e-ecc0-4702-9d2c-88ff420c4647@redhat.com>
Date: Tue, 24 Mar 2026 09:13:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 11/14] net: dsa: netc: add phylink MAC
 operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.fainelli@gmail.com, frank.li@nxp.com, chleroy@kernel.org,
 horms@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Wei Fang <wei.fang@nxp.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-12-wei.fang@nxp.com>
 <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7i8a8dnEQQ1nmznrmu-2xJkyaBzhCelzhbPGBE7Ppz8_1774340016
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/23/26 10:30 AM, Russell King (Oracle) wrote:
> On Mon, Mar 23, 2026 at 02:07:49PM +0800, Wei Fang wrote:
>> +static void netc_port_set_mac_mode(struct netc_port *np,
>> +				   unsigned int mode,
>> +				   phy_interface_t phy_mode)
>> +{
>> +	u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_REVMII | PM_IF_MODE_ENA;
>> +	u32 val = 0;
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		val |= IFMODE_RGMII;
>> +		/* Enable auto-negotiation for the MAC if its
>> +		 * RGMII interface supports In-Band status.
>> +		 */
>> +		if (phylink_autoneg_inband(mode))
>> +			val |= PM_IF_MODE_ENA;
> 
> I would prefer newer drivers not to use phylink_autoneg_inband()
> anymore. Note that there is no need to support RGMII inband in the
> kernel (nor is there any proper support without a "phylink_pcs"
> being present to provide the inband status.)
Would you mind sharing a patch adding a comment nearby
phylink_autoneg_inband(), explaining the above for future memory?

Thanks,

Paolo

