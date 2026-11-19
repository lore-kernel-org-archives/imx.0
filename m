Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125651;
	b=Qu01/s7pf0WEaDXTutNQBa10ZjZQ3LpNOvpoXZRZ8Q5FPJA9cOKPdVYD6G+d+c000k/7
	 avPQIbs00okvkdes7PntRdnkXndyIblYFnDu2lCGK8go5nit9oxEtWJQoCASEr2/bk+BG
	 /DcqZtCj6SPyN9Z+JHw8SSmFXamu2VLCTlj/sCDFkUhFV1QhA7Z2EBBNvtOmsmPbvcmmi
	 PV1xY0pE8gw3Pt4xAEVy4vvZnR6K/NP7di5Cm1/zr+nso1/Vqa7PJQaIBLA7R92UD3FLA
	 YthatebNwebia2nkqlw7Kaw8yVKa+AXneLKuLPyTaomunCYPNa2Hx1Ua9Aiq4oUoXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125651;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=2eWpDBRmcu+B6+6vy7I8j3e9wXPh1l735Y8e4F1T3H8u5ZkxDFGzbEAqEEzxDpYomxMT
	 5ZB1vapSy0YtXBzvuqhCzUZe5hCNHDmlvbziRcTr5KWEhivXzk5WmJw6OcCjDFpYJ1Nar
	 gnkPX2PE0rpbZ6FBd3FFB8uIfbkXwHJy5GDKxU5dSJYHoGuecDeZDDQR+I4DHO++Js4DG
	 zAs4c24MfqK3Uiold9L+RsbTIPr35GoiGbywWVHRy0Y3LDp4HckeQ2Q7iQXPFoNWqhWRw
	 ubGcT2rNdUubBw230DkjdIcQ7ZEd4T+e/CZNzI5K/IruTM66Eu4sCfYEqKb0YwdIcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM+C6n7t;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F3F606A32C
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 22:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F3F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM+C6n7t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795125650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=TM+C6n7thLGDHSwPFUvZSxTFJcU5l+nbqWdHvXdMy2RRNI67yHayOSn9w1zbALaTMEHcya
	AiJvSOo15tTnSyrEz2Y9qWuydaCzgtfF7Ip5VZvo5UkGaIPB5Wq5OlZuMczDE2iEYQDCL3
	2q/D9+bPTT6wXf/uCKmk3rE49EFiK4s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-OeBCyAwWN_q1ii2KDzrCNw-1; Thu, 19 Nov 2026 22:00:47 +0000
X-MC-Unique: OeBCyAwWN_q1ii2KDzrCNw-1
X-Mimecast-MFC-AGG-ID: OeBCyAwWN_q1ii2KDzrCNw_1795125646
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6ceb2d54so44355e9.2
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 14:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125646; x=1795730446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=vehKRQ89mWwCx86+9R/qhU/gJ3wOeG8IzVJHQq768BjrFxrVcjjDfDB0GWNTj3Z876
         zbk+PR4bo+AjPZIca0xP8Uz3AHb+O0TEwAfziIJNBYfBY5RdFv84cuQXY80eAaa/WEVI
         +YBMoNoO7fvxzReaPYHVq5zp/3K8yuOn1UhndIywjA+xtkns394R46ZiPcjpTWNPZcyZ
         Rx29HWVg/ams8kVxCBh04ehE8Br0fmAAgeT8KA7b/3H8HH6W7qrTej9mXiatBfZzpuSV
         GvCrP7c15XswGqQo/D9f1AASitegMNFo/DYzaDjD2Uep4oJWAeNnVWW3yCjKlC5/08z7
         SlFQ==
X-Forwarded-Encrypted: i=1; AL+hErEYjShZ+t8eFiKfasRZpem8o8yQASNUr8c9bxkOs3HDeU+RGIUGBNylMlMGJPco54LGR2Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z86QlDfCpaDnWl6afAPOv69vNNjtLaGMZVK00F9TOCmluOP72yE
	npijn8pD17amIjBdD6fJI6GrZZxtnPv8PeBjUHk3N/RMgJgCNWpBEPHIBcFuYgWEdD+7//TdIsH
	JENIr7c5IObPl2ZnJqgftUB0y7Bzt7X+qRyA/PNdtn2WpcTybfHofkQ==
X-Gm-Gg: AYBFou0I3n8rGnH8jLRJYmBZwEN9XVzI6dvs3EYFgHNeXK7gawT09dXeRrkETU7BMBd
	sjtFiKqX9Xdglz/INBqbVkCidv9+Xn7dUv4jTvh4z1vbMXJOkLDsQDoncy9XgfxR+ot7leB8D/i
	nCaOmu05Q2H8lHohdrgknin8LWd0gpGXl/PdNqANA/K6V+qrQvxAL0FPWvg1FfZd5IX0KwXAhRQ
	jQFIgY0xelJhlPV+8GS4CRnIt6rnTWoRJwg3REo7s2laZGMVFisEOTmQ8o4c6lKkcq7yj9asZ91
	+82b64fD/KQrbgX5i349tq9ORqEL9tHEItIWRnETr/1sLq8Tr7immvEhZRK9FEMDa4Ge27f+uWy
	tGl+nVKqD5MyKGheg/rxEzbnuqnVWxcQBtfdjWSapz8G0GuHxLV+EkbyLFQydrBE0Z5p6dDUnq3
	H6KUxh+D6fMt5gWg==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15282185e9.1.1795125646334;
        Thu, 19 Nov 2026 14:00:46 -0800 (PST)
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15281675e9.1.1795125645874;
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm1963679f8f.8.2026.11.19.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
To: netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM) networking support
Date: Thu, 19 Nov 2026 23:00:34 +0100
Message-ID: <20261119220034.1658710-1-eballetb@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
References: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xab9VN7aEAdLeHDOjPVLtki2xF1_YQYIXiH4Fc4FdG0_1795125646
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

On Fri, Nov 13, 2026 at 05:02:31PM +0200, Claudiu Manoil wrote:
> This series adds networking support for the ENETCv4.4 pseudo-MAC (PPM)
> ports found on the NXP S32N79 SoC. On S32N79, the ENETCv4 ports are
> not wired to any external PHY/MII; instead they are internal "pseudo-MAC"
> links into the on-chip NETC switch. These links are proprietary, expose
> no standard IEEE interface, and run at a speed fixed at boot time by the
> Port PCR[PSPEED] register.
> 
> A key use case is a port that has no "ethernet" DT node at all: NETC is
> reached over PCI from a host that probes the ENETC, while the internal
> NETC switch it connects to is not owned by Linux. Such a port must have
> its fixed link synthesized at probe time.
> 
> The driver synthesizes the fixed link directly in C using an of_changeset:
> of_changeset_create_node() adds a "fixed-link" subnode onto the PCI
> function's dynamic OF node (CONFIG_PCI_DYNAMIC_OF_NODES), with the "speed"
> property read from PCR[PSPEED] at probe time and "full-duplex" set.
> phylink then picks up the fixed-link node through dev_fwnode().
> 
> The series touches three subsystems:
>   - net/enetc:  pseudo-MAC fixed-link support, probing of 4.4 devices
>                 and a fix for more than 6 ring interrupt vectors
>   - arm64 dts:  NETC IEP18 ECAM node on S32N79 and its RDB board enable
>   - PCI:        a quirk creating the OF node for the ENETC PMAC functions
> 
> Because this is primarily a networking feature and the pieces are
> interdependent at runtime, it would be most convenient to merge the
> whole series through the netdev tree.
> 
> Patch 1 has a runtime (not Kconfig) dependency on
> CONFIG_PCI_DYNAMIC_OF_NODES; absent that, the pseudo-MAC probe path
> fails gracefully with -ENODEV.
> 

Hi Claudiu,

I tested this series on the S32N79-RDB board running latest mainline kernel
and applied your v4 pseudo-MAC/PPM patches on top.

I used, though, the MRU MSI controller for NETC IEP18 overriding
the upstream msi-map property with msi-parent pointing to
the NXP MRU MSI controller (this driver is not upstream yet but I ported it).

With that configuration the ENETC PF probes successfully and networking is
functional on the board. So,

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[1] device-tree diff

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 897ba24ac03a..a8a3602505e2 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -70,5 +70,37 @@ &usdhc0 {
 };
 
 &netc_iep18 {
+       /delete-property/ msi-map;
+       msi-parent = <&mru_msi_controller>;
        status = "okay";
 };
+
+/ {
+       aps-bus {
+               compatible = "simple-bus";
+               ranges = <0x40a00000 0x0 0x40a00000 0x2000000>;
+               #address-cells = <1>;
+               #size-cells = <1>;
+
+               mru_msi_controller: msi-controller {
+                       compatible = "nxp,s32n79-mru-msi";
+                       msi-controller;
+                       reg = <0x40a40000 0x40000>,
+                             <0x40a80000 0x40000>,
+                             <0x40ac0000 0x40000>,
+                             <0x40b00000 0x40000>,
+                             <0x41a40000 0x40000>,
+                             <0x41a80000 0x40000>,
+                             <0x41ac0000 0x40000>,
+                             <0x41b00000 0x40000>;
+                       interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+               };
+       };
+};

