Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DDF330646
	for <imx@lists.linux.dev>; Tue,  5 May 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974242; cv=none; b=Yk4wiq4UuobttW872nlGc2V8yEpvF/x3ad3tEGd8NsY69yjRZURf7Su2Wnpz/Eh+LsBJ1xwRAX3qSckmAYGWKNaysYWwlbhva+wqqumo+7lK2flgZ9D1yALFrV0t/lI7pRYO8lYHE7XJDtMVnBmSD75VvGtdDbryI0GxkUYkA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974242; c=relaxed/simple;
	bh=GB2zSiCiH2B2MkSpdmM8X1Yz2rkioSL551rkMUaheIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6qL0o/cTnzkigMxLwS1tKQKnoLkrSXkGIXQxOh6OjPtj1wa8KS8BkUfeFLxWw7pFM8j9OE8Wkiosihj4wsfF7sTCzoZ9+x4aBzKgv2Guwxk1ff6NB/Rk4tAmFUapgLmT8S+J5IrXiiDc/3Z6BQgQmXYKEg+YbMAE+X9L3trgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dmaJ5jtd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dmaJ5jtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777974237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
	b=dmaJ5jtdLJSdH9PZjrm+u5GTvfAiIM5WnJ5pZV7AxMxDAp13oCSR8MJ4clZAMBaG11nIxF
	V8XMZmIbxNu7zOPnMlIOHDZK7ycUwLxFzLNaCnf7FSzL37NXYkdnocz5I9Li2F5gCgDaou
	iKWnxA73AGYgd16jh6XY0Wxns1UJyno=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614--6PRfj36Mh62N1VAzqSPyA-1; Tue, 05 May 2026 05:43:55 -0400
X-MC-Unique: -6PRfj36Mh62N1VAzqSPyA-1
X-Mimecast-MFC-AGG-ID: -6PRfj36Mh62N1VAzqSPyA_1777974235
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48d035e8593so13286175e9.0
        for <imx@lists.linux.dev>; Tue, 05 May 2026 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974234; x=1778579034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
        b=BVJwh6LS1tXbrphWKf1LuGGEKedQ4Aj3xYE8l7arC5K3JafHUALXaDXTnIZvIrpD/n
         afw2mbm71/lMHuCC9ODxvAizQXXaytLpA0hRSVoR6FoPtwLqE1vLBfEBF7emSW4DmJ8C
         k/a+kBcwG8eiuLnIpiv/dskkL4DxTwr0awJQrElvFetL5y4J9RrVevZWERHI6QkIBTe/
         HI0IDjgm38J9kd3BdrmhaNEJVRvzr8KltuL3FqHS4etT/TkgfU1wVwWywme7L7F0Mrkt
         p7ff+bAqTkMh96oA2X712X2QFMAIBAIHws06uFxcR5+Uzw/e0X+J+4yjFu0ai/BYbwSH
         RA7g==
X-Forwarded-Encrypted: i=1; AFNElJ9RJdJ5SUWjzfH9zM6w5ar2Uv6z2KeLcWhT6BizrS6YtwHfFHGCFfJEArrJDFpKUoKk9jo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF29pMgMgXP+LqWkjYygBtmsP7QwcyTVPdF++45GEAqIko0V8W
	Blyst/W8tWtqbIt/K3hxX3v0bxGbvMB5ejMejHME1C+f0erWSS2UljYNI2CQ5p1gkb7coyGma37
	mBm/cZ6IXfcU0Q4e/pYMqxdqiI6AQjwS/VhgQSEqSFNtONYfWd00wBg==
X-Gm-Gg: AeBDietVfW11vgUWNxMugUhybXQgIT1nrNWsttUz0SObecPhP78SAeHFNMRgE3NBim6
	x0WsjgZF+qOqUmWJFXCZ8G+8DdJdsPsHUb9ogQo+vXKytotxxT/b0PUQP9ssC1c1k0VQF3U0GQE
	NQy8X8/w1UR8DgOLgBIKAasNJJEsfTt2odU90ptY7fwFB0P3B2EYaoIkZW37DpoPVxdiMr15a6M
	mT7PhPmOl91antpjCF+p3HBuOlsyVOfOhHNvgAG1kkcXlFhejE3DvT7BmhqUNRp4s8Crn5VfPwH
	XD7ygklIzw2RzP4pCkjCupLy8rUujx3e4yexNYncTCcCyl6ljO5N449Bkvr1LC8rQE88nV6Y4uR
	wXksvl5hG3Ftrew7D2++licNvFR5p6Df02Fdy8yYj07VW9ikJysAKXVHVZSZQXrahVHY=
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr218127005e9.29.1777974234592;
        Tue, 05 May 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr218126385e9.29.1777974234170;
        Tue, 05 May 2026 02:43:54 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603894855e9.1.2026.05.05.02.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:43:53 -0700 (PDT)
Message-ID: <37382811-ba47-4432-9911-6c39acea4f86@redhat.com>
Date: Tue, 5 May 2026 11:43:51 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 15/15] net: dsa: netc: add support for ethtool
 private statistics
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
 frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org, linux@armlinux.org.uk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-16-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430024945.3413973-16-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HABEPFDMjyc4cjuRswvW2fOAkfHyMY3oFd5NH3fscJs_1777974235
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/26 4:49 AM, Wei Fang wrote:
> Implement the ethtool private statistics interface to expose additional
> port-level and MAC-level counters that are not covered by the standard
> IEEE 802.3 statistics. The pMAC counters are only reported when the port
> supports Frame Preemption (802.1Qbu/802.3br).
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/dsa/netc/netc_ethtool.c   | 107 ++++++++++++++++++++++++++
>  drivers/net/dsa/netc/netc_main.c      |   3 +
>  drivers/net/dsa/netc/netc_switch.h    |   9 +++
>  drivers/net/dsa/netc/netc_switch_hw.h |  58 ++++++++++++++
>  4 files changed, 177 insertions(+)
> 
> diff --git a/drivers/net/dsa/netc/netc_ethtool.c b/drivers/net/dsa/netc/netc_ethtool.c
> index ac8940b5a85c..8d04db534347 100644
> --- a/drivers/net/dsa/netc/netc_ethtool.c
> +++ b/drivers/net/dsa/netc/netc_ethtool.c
> @@ -19,6 +19,56 @@ static const struct ethtool_rmon_hist_range netc_rmon_ranges[] = {
>  	{ }
>  };
>  
> +static const struct netc_port_stat netc_port_counters[] = {
> +	{ NETC_PTGSLACR,	"port gate late arrival frames" },
> +	{ NETC_PSDFTCR,	"port SDF transmit frames" },
> +	{ NETC_PSDFDDCR,	"port SDF drop duplicate frames" },
> +	{ NETC_PRXDCR,		"port rx discard frames" },
> +	{ NETC_PRXDCRRR,	"port rx discard read-reset" },
> +	{ NETC_PRXDCRR0,	"port rx discard reason 0" },
> +	{ NETC_PRXDCRR1,	"port rx discard reason 1" },
> +	{ NETC_PTXDCR,		"port tx discard frames" },
> +	{ NETC_PTXDCRRR,	"port tx discard read-reset" },
> +	{ NETC_PTXDCRR0,	"port tx discard reason 0" },
> +	{ NETC_PTXDCRR1,	"port tx discard reason 1" },
> +	{ NETC_BPDCR,		"bridge port discard frames" },
> +	{ NETC_BPDCRRR,	"bridge port discard read-reset" },
> +	{ NETC_BPDCRR0,	"bridge port discard reason 0" },
> +	{ NETC_BPDCRR1,	"bridge port discard reason 1" },
> +};
> +
> +static const struct netc_port_stat netc_emac_counters[] = {
> +	{ NETC_PM_ROCT(0),	"eMAC rx octets" },
> +	{ NETC_PM_RVLAN(0),	"eMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(0),	"eMAC rx frame errors" },
> +	{ NETC_PM_RUCA(0),	"eMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(0),	"eMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(0),	"eMAC rx packets" },
> +	{ NETC_PM_TOCT(0),	"eMAC tx octets" },
> +	{ NETC_PM_TVLAN(0),	"eMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(0),	"eMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(0),	"eMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(0),	"eMAC tx packets" },
> +	{ NETC_PM_TUND(0),	"eMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(0),	"eMAC tx invalid octets" },
> +};
> +
> +static const struct netc_port_stat netc_pmac_counters[] = {
> +	{ NETC_PM_ROCT(1),	"pMAC rx octets" },
> +	{ NETC_PM_RVLAN(1),	"pMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(1),	"pMAC rx frame errors" },
> +	{ NETC_PM_RUCA(1),	"pMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(1),	"pMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(1),	"pMAC rx packets" },
> +	{ NETC_PM_TOCT(1),	"pMAC tx octets" },
> +	{ NETC_PM_TVLAN(1),	"pMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(1),	"pMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(1),	"pMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(1),	"pMAC tx packets" },
> +	{ NETC_PM_TUND(1),	"pMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(1),	"pMAC tx invalid octets" },
> +};

Sashiko says:

Are these standard MAC and interface statistics being duplicated in the
driver-private ethtool strings?
The networking subsystem guidelines indicate that statistics which have
a standard uAPI must not be duplicated in ethtool -S. Standard
interfaces like struct rtnl_link_stats64 or struct ethtool_eth_mac_stats
already exist for counters such as rx octets, rx packets, dropped
packets, and FCS errors.
Could these metrics be exposed through the standardized interfaces
rather than adding them to the private string sets?

Other comments are AFAICS false positives.

/P

