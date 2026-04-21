Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59994374E7A
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 20:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801784; cv=none; b=WSerLwHyyl1qy/dinOfzXQPMvkoJIRhNqv8YH9L8jWkyqIhuXkGzZjZ3Yi6QLX7Wgg5R6JohZbwe52GsBnXrjaJrRo+WhgS+bYSTMRTbe0sbrBjr9Vi3vrBKfsh3ZCNht7gUYTr2K0/R+EVHS30pC7aOqs6gNedzz6FEKuzvQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801784; c=relaxed/simple;
	bh=z/yo03AiSA0eCKVwpNdHXlr1nQWbFRacndf5yazbhEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cIbCxKhWsJGb/YQRQmyk6ziw96+bmYE0BnJe7WCehfyOAxLv4KgVrkvDqtaw+PrcAxgbH+Uy1UfY229Mrrt5F+JJS59tsLt27ZvQhrVdi8voGap8WKmS53+JMVvOCk/+xcBcLzampqcBLBXJcN7C0aSqxk+pXS9JiXY1uXuoTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y15qGO7K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y15qGO7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776801782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
	b=Y15qGO7KatdL8QazAM5wT6++n+fu4VAih4ufZsVgYo0ESc2Tb5Wl8Qsoq24N3D37l1qRRG
	NM9Y+bBKmhYZL51LZ5uqXBTQL7esDc0GJz/S3nJSLcb5nxs5DePMQJ8TR0Q+o7c5mhZxoo
	tpM4UfdP1fovgyRu70fQOJzv1kEo22A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-P2uxbni4NZ6gqjo_p0vu1A-1; Tue, 21 Apr 2026 16:02:59 -0400
X-MC-Unique: P2uxbni4NZ6gqjo_p0vu1A-1
X-Mimecast-MFC-AGG-ID: P2uxbni4NZ6gqjo_p0vu1A_1776801779
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so70005906d6.2
        for <imx@lists.linux.dev>; Tue, 21 Apr 2026 13:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801779; x=1777406579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
        b=CudbYsw5qTjH3I26zLRHOKUsehQHKSgA6FAkxXRlMWRUOLxKiqbEql0WZAkykWD2oZ
         dkNu9xts6YZJkzWgSlA+qnj/2yGYCxf4hN0SKu7rJN+OfzSlsnCE086OLXUv4B4P0u81
         7JY62RNxAfLSLFvCPJm5HA14Jw+EKTQn2k2V4kiw3wIdxINfEWmNytDwZp0dgkgZMSY8
         EJwhHnzf0H4vlHJKzuwttubZzzcUWZxdSIVAyUZvzm1xHwiJ/zafmJE9diobozNlIvLl
         usYQgda7eGPw35ZIE90dl914SOJTnOsj8PyDM0071L0tXCK+yK1X7V4g6thhFKZfxxA1
         WKcw==
X-Forwarded-Encrypted: i=1; AFNElJ/A+r7xOK+hTIWfZvvu3dIFDmF0lCC015t1H/Bb6KMGhIGk8Bljb1ecfJ/rQfgPHgj4GOU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFaxe5nZtZRtHp11cJotUJVlupPkeUbWn1+2JHHZHE68N8llyo
	l8TIkByzb7Yi4zNEgHECcX5tCq/sRw/Bq+NKs4MGFqpnm/BEfMTbAEtEki3YMd+J4G4Y6GSOPZc
	12fa8hpgBA1iRvPoQza/fCqd3g5HfwnCZf4aZ2QRa4hSK5rDFpaR7MQ==
X-Gm-Gg: AeBDieskbbQGCBsZL5O58k0RFfdHwDRiLWSk3NTV1yb+Gtkxs6XvzNHcq3EOWAMIWfp
	OJXAm6Xp/xcrVV3wFyxtsbZrL4AH4/f1ci3PYxGokoK+rzNpYOc6xJN9+AlXUs7h7wyLIBoBUi3
	6o4z3Qdn8ZgUUS6ZpG7WdDwR0uv4WvXmAxVi7blFlqvbqXT3B1xJhGl9sj7AKwwgSfsoXW/wuN3
	X63i4EzOdBDSqrFA5Sca/9EHbYFhslzaMKmOAIWM2Ny/wDTDDkhtYP3FF8NaykQQoMS39QUE+Nk
	jY+c3MVzBRF3IF+rQdB9z2GgjGjlBJqqFsfAxzbq5MS12d4gdBKHrMR6zfbQeaLAC9vaQa+7YEE
	+kaRiZAPug+KZnOiGOApE1myktLz0Q21/FJDQ6hm4jw==
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id 6a1803df08f44-8b028015984mr335683796d6.4.1776801778635;
        Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id 6a1803df08f44-8b028015984mr335682706d6.4.1776801778111;
        Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5ec2dsm115982646d6.29.2026.04.21.13.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:02:57 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:02:52 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v11 4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aefX7Ajltzt5EqIR@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CyFfFLXtrM1NWJrecioCwNLXwyRUcaBzUVGEl37_34E_1776801779
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

On Thu, Mar 12, 2026 at 09:55:30AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Based on previous changes in platform driver, the vendor
> glue driver can enable Multi-IRQ mode, if needed.
> 
> [...]
> 
> If those prerequisites are met, the driver switches to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>  29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>  30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>  31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>  32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>  33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>  34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>  35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>  36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>  37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>  38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>  39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

I ran this series' changes on an NXP S32G-VNP-RDB3 (dwmac-s32) and
confirmed multichannel TX by doing a basic iperf3 throughput test:

    # dmesg | grep Multi-IRQ
    [   37.463467] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
    # iperf3 -s
    [connection logs snipped]
    # grep end0 /proc/interrupts | column -t
    29:  0      0  0  0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  968    0  0  0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0      3  0  0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0      0  3  0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0      0  0  3  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0      0  0  0  3  0  0  0  GICv3  98  Level  end0:tx-4
    35:  67302  0  0  0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0      0  0  0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0      0  0  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0      0  0  0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0      0  0  0  0  0  0  0  GICv3  99  Level  end0:rx-4

Also tried out multichannel RX by adding 'snps,route-multi-broad' to
rx-queues-config/queue2 in the devicetree, which showed activity on
the corresponding rx-2 entry:

    # grep end0 /proc/interrupts | column -t
    29:  0   0  0   0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  4   0  0   0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0   1  0   0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0   0  1   0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0   0  0   0  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0   0  0   0  1  0  0  0  GICv3  98  Level  end0:tx-4
    35:  68  0  0   0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0   0  0   0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0   0  91  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0   0  0   0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0   0  0   0  0  0  0  0  GICv3  99  Level  end0:rx-4

I didn't see any regressions with light network usage, and both TX/RX
appear to function as expected.

Tested-by: Jared Kangas <jkangas@redhat.com>

