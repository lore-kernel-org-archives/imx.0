Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54720B1F4
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973067; cv=none; b=NnQANlD0n8DHAgqX2UserzZlIn+cgM11zZT2vJoW4evEZ1d+9FgyumJsfq9LX6c2A4NPgjOLGgQEn7lqZd2oQb0+WitJYy/rdOWLfzdubktS2SN0ky/07x9QVi4jK62kdoi9tdMJRUUfQi5TzlxVgZcwoywwmbKSSG0/PQV9+uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973067; c=relaxed/simple;
	bh=I3YlaLMNbIntcC3nHGYxd3PhL0m1vzFc22REJONgU9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q260MVYThcJ23ErAwLv8ELV1DWDr3ORUWO4uTTh0vzGaRZ9RKhpawGqTZmZuLrS64SU/5oC7BxnfxuEZWGetxXPZcdReXSBciA7xMGc94+OfmhzZWiKy5rknDVMQbrl6TekBjiybd5DFTMxnlypEqkyMOXFUPh9nBD4TuuW+3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FcEHS417; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcEHS417"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751973064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCCSM5EGfPIeP6kZ4qXJFewXUNSwRA78to6oWgtBl/o=;
	b=FcEHS4177XoJyPOLjEsJkt8pgUqZ2Yv+oyW+tJySWGlljKoyH9mt/eARJUv4korqU/AIKd
	H/Lj5N/m9hFTpiza265qL7g35sC/ibifu2gUtK5C5Ehb6CTVl6pXdDAL9Q1WRn86GH2Rot
	rRZ/3Qw7jWJWucA00NOJ3b360BkSTZ8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-WfG_CIoMOzav3SgqgQv6oA-1; Tue, 08 Jul 2025 07:10:58 -0400
X-MC-Unique: WfG_CIoMOzav3SgqgQv6oA-1
X-Mimecast-MFC-AGG-ID: WfG_CIoMOzav3SgqgQv6oA_1751973057
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450db029f2aso19540075e9.3
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 04:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751973057; x=1752577857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCCSM5EGfPIeP6kZ4qXJFewXUNSwRA78to6oWgtBl/o=;
        b=NP2fYk6fzBoV0BPN6Pf/U8dQ6CjCCdkq08WDYsywFK+AS6MYSsIuVwh43OOkepUSZm
         j7A4cn92s+whDIZBeDqw9ouzi/PunMW7N2IxJtceaEUBNmE9kkH8SzzJprTKZbJ8fMlm
         4Ax+M5QhJ9u9M6/ZS0eyCs6NTEhVbjmNoTcud6SZ8pCybMlP0irm0TWL/3paIG8w1e2p
         42THyfsbmOXc2PLl4aatGJZoenhN7CURYe9KPMwDMBbipeJr5l2JwTCCsV9Z+AOTnw2z
         VNlQ6l2YxR4xTlvHtNH6NEQ5NPrVcM3g+dpOPE8kfkwLae5uIHERD6Q985QAhUOz5m+z
         4J2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/pZh0SR+TKTjH32NGqeKCFGpozgdcqbLZ6DXRvL4YbaXfLGosyzTBfazQZ1cNrCfTbAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPLSnQlzf0aoY7UJD779hYsTy6PAzO+fraMotnjHh4CtH1Fi5n
	PUYfHNWCCBhStXhhPJQbA7sDG9VW5tPQM49nB0hOxguOo1f7MU0wwQLmeLIBAlMh19dkTED6i5m
	JK2zhQltO2tYVSB+DOwbsSHxtyEu5V02JotYXyGZv747WWGm+O2Ml3A==
X-Gm-Gg: ASbGncssi+3NTSkl60CiKfyYB7TN5egK1dUiaEmwSd/QRIC3sU0VW2+M08F3tJ3jHJn
	W4rU0Hg8sFrALVf/zjXSGHyjOZbS9J8ChzUyZs1Ob212pps/8bImAtvhEQex52uzRE8PWYPInKV
	4aIzqmxPGJi3oJED4uNe7XxBRkhugrTLngW8dFLEtQ9hWiaKyRsb9XtzLQ8KHI9ZLy2v/wyvH/F
	/gfKjW8SUZ9LpfvPPgPbYabJ5Vo7OZgyd+iHsJDLZkr7j1839eMUxH+1a8i9HtwvDUUWRMkvocB
	AVA4OoJpQMmGFt4zVv8UX645vKHm4bsoq8ksT8ioHUb/+Bcj3by4Uzre7V4LMec03xRIgw==
X-Received: by 2002:a05:600c:1d8d:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-454ccc7ffc5mr42390565e9.10.1751973056826;
        Tue, 08 Jul 2025 04:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaNulokkynI0xWQ9J9Q5uhDXLP6/QZtP79j6yK8Ti/Akkv8f7oR/DstuNuGnFQRRxDD3e+uQ==
X-Received: by 2002:a05:600c:1d8d:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-454ccc7ffc5mr42389995e9.10.1751973056363;
        Tue, 08 Jul 2025 04:10:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd3dd1aasm18697345e9.39.2025.07.08.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 04:10:55 -0700 (PDT)
Message-ID: <617d064e-99e4-491c-8fe7-d74d8174d9fb@redhat.com>
Date: Tue, 8 Jul 2025 13:10:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v14 04/12] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250701114957.2492486-1-lukma@denx.de>
 <20250701114957.2492486-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701114957.2492486-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlzHf-gVOduyhSSijN0oUReh_DtTx7JNApnaWXINsHk_1751973057
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> Changes for v14:
> - Increase the maximal received frame size to 1536 (for VLAN)
> - Use spin_{un}lock_irq{save|restore} when altering dynamic table of the
>   switch and mtip_adjust_link() as both cannot be done when switch IRQ is
>   potentially enabled

Why?

 (the previous one alters entries in switching table
>   the latter one may reset the whole IP block)

What really matters is the scope (process/atomic, bh, hardirq) of the
relevant callers (the functions that do acquire the given locks).


> +/* dynamicms MAC address table learn and migration */
> +static void
> +mtip_atable_dynamicms_learn_migration(struct switch_enet_private *fep,
> +				      int curr_time, unsigned char *mac,
> +				      u8 *rx_port)
> +{
> +	u8 port = MTIP_PORT_FORWARDING_INIT;
> +	struct mtip_port_info *port_info;
> +	u32 rx_mac_lo = 0, rx_mac_hi = 0;
> +	unsigned long flags;
> +	int index;
> +
> +	spin_lock_irqsave(&fep->learn_lock, flags);

If the _irqsave() part is needed (and I don't see why??!) than all the
other `learn_lock` users should also use such variant, unless already in
hardirq scope.

[...]
> +static void mtip_adjust_link(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev;
> +	int status_change = 0, idx;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

Same here.

/P

