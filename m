Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367500;
	b=ihLek140oQHx8z79xc1GLEVumMrcm4SjuDlyHAwXmqvZ8j/SYYInhOSDBQAkII2dYitL
	 RJ1h7F9z3eQPMGgycfVyzajU0QbTn0/8VeOjrGQU8yeXDLAzqfQdS9iFkvPSo0XxtW8bb
	 J1P7MgTXywM0kKTVUvLcAey3oYAI1zbj2etsuer2/uJjAnr5DBA2gkbbuC6TA1inoyoNw
	 DCE5Ny7GV9bY7mYGEWrNp84DP1OZMdrVtHx14SKBwG9ROF0CBUsZJKKuu63FPFHGeFxIZ
	 k9f6zZPKPjcIiYBA+LHImQqZKJkIeGEBE4wGA5e1ZJt6zkKpUBVKba5UxPXN+Mp0oTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367500;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=tTxGjni6rhjTmqiQfCfE+U2B6fI2RcU05MCzDG2LfkA=;
	b=AWKNZlNN7uFJ3V9I7uXNyCCal3h06sSNXg/qIfCdaGvLEhG88uYWJRkgD5qVpI9WIpwG
	 tK+RjpOzvW8WBpjcUMQLVF5tAs/KZ4TkRJv4gNzooZhNKA+m14eCvV+uz2a4Pd+m3uwtb
	 0Ls1VeKmyxKtLVYFvZhinRL4pf9tN7FdYg8Z9XPGmJ0sP6OxJwUwAqwBDf4kxB0hFvRAX
	 bW7QAmZPFSU+vaTyobJfcTA8YwZFa+vpIKMR7IBBJRHRen9qz4PL/L1O3sjLZCvhKHNQt
	 pYEZXvUNJdCVmsNr3DS16N70v6yRgibxzrB0jRDpj/ZRz70HabaaYn/72Jf5db0tcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=y8ZpBqWy;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409C606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 17:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1409C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=y8ZpBqWy
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id VAxXxQPaaAR1iVB6JxRol2; Sun, 22 Nov 2026 17:11:39 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VB6Ix27ralaNKVB6JxnQh6; Sun, 22 Nov 2026 17:11:39 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6b03224b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gEfo2CItAAAA:8
 a=p-LfKV-GAAAA:8 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=j0joHclq0SJ7U1mQr38A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=97BuGM4RKn6GwmfqMd6i:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=tTxGjni6rhjTmqiQfCfE+U2B6fI2RcU05MCzDG2LfkA=; b=y8ZpBqWyOehh
	63EQ93CI6CQNRodu1CCXTUWMsDxrcYZ9N+Fy/C6efmucmLQk0lLOxRTgZlGiT/ohfmrhmHsM2CwJX
	WmhzVoTkWO7vMe+JzXWX6BAW7C+W/S37VOmoVanjhW6tSMQcJiDlg0M/PjSBxq6Bn8Nt/FaZVvuu7
	DA0liX2cFkQry5wzbXgcroR/9h40Rs5mQmKICMqlCMFOukI2wVMjOfh0MXgDqILRz/+e80KOovXuI
	5WrREW5vPoHywlnHTLahnNDnTWdYtctCHxdZF7JOyoSZKQjWb9YyihS237RPIyWgVpVnOdMTk/q8I
	C1DZ52UtYcs0Iw7dUkxkKw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57044)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVB6H-00000002vnN-1my2;
	Sun, 22 Nov 2026 22:41:37 +0530
Message-ID: <20869dbe-f47f-424a-98d2-2c61768790f6@roeck-us.net>
Date: Sun, 22 Nov 2026 09:11:35 -0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
To: Lukasz Majewski <lukma@nabladev.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261120094211.1742416-1-lukma@nabladev.com>
 <20261120094211.1742416-2-lukma@nabladev.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261120094211.1742416-2-lukma@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVB6H-00000002vnN-1my2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:57044
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLNcfQWt6cNC60Rih9dvxozINP/eoyFLocb96lgv1sD+UXFvK15yoOvjNPNCKfNJnR3FnXrDPBI9iHGHn2EAvxUPPLfGSRQyO6lSDxC0/o7YMI5e6NZ3
 4eYDlDNDbdDdhthwUFwkkjC9/PhWulJuMZqtt8YNZvIWkGTRBnTQIt+KhGbP8QdEahlVj9YCsYYTDGVV+UKQ1ptJnQMZopL09os=

On 11/20/26 01:42, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

This patch wasn't sent to the hardware monitoring mailing list, so I expect
that it will be applied through some other branch/repository.

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
> Changes for v3:
> - New patch, as this IC description is added to Documentation/hwmon
>    as a separate entry and not to trivial devices
> 
> Changes for v4:
> - Add Reviewed-by tag
> ---
>   .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> new file mode 100644
> index 000000000000..fbb6e711342c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/national,lm77.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: National Semiconductor / TI LM77 Temperature Sensor
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +description: |
> +  The LM77 is a 9-bit plus sign digital temperature sensor and thermal window
> +  comparator with a 2-wire (I2C) interface.
> +
> +  Unlike the LM75, which has a single alert output, the LM77 features two
> +  separate open-drain outputs: an Interrupt (INT) output and a Critical
> +  Temperature Alarm (T_CRIT_A) output.
> +
> +properties:
> +  compatible:
> +    const: national,lm77
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C address of the device. Depending on the A0 and A1 pins, this
> +      can be 0x48, 0x49, 0x4a, or 0x4b.
> +
> +  vs-supply:
> +    description: +VS power supply regulator.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      The LM77 has two open-drain interrupt outputs.
> +      - The first interrupt should be the INT pin (window comparator).
> +      - The second (optional) interrupt is the T_CRIT_A pin (critical
> +        over-temp limit).
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        temperature-sensor@49 {
> +            compatible = "national,lm77";
> +            reg = <0x49>;
> +            vs-supply = <&vcc_3v3_reg>;
> +            interrupt-parent = <&gpio1>;
> +
> +            /* INT routed to GPIO1_12, T_CRIT_A routed to GPIO1_13 */
> +            interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
> +                         <13 IRQ_TYPE_LEVEL_LOW>;
> +        };
> +    };

