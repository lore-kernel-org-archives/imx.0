Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881874;
	b=3pFOPDvW2lGqkt9aqt5dlPkLRB57b61m49eoJxs2X12JFabyi/CIBkd3NeTfrpIR4py+
	 CwgxKZjgmDk3+ZoLyxkXqD8jcBwS/KNzW+8AmwmH6nTZGXG/MSusoDFJEMePIrfe+Uyv3
	 3A3VkFtifoC0O2wQFTxpm50G/rH7Qqj5XqZYOsa8gpSZBo4jJzjwgKtaCaABvMoV5aC1f
	 I3AeRn+lm7sHbqEA27Yc2MqqHDvuc/6xibw15KBNqiO3s5kMdFCy97Yc1ZttdYlK+cYT0
	 8OXZu/JiIu4YMb8SGIbDRNfHRv11U2Pn2pfJKTVHZcK7HETn/05IjgpznsmW5Xqh6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881874;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4/oRDqwhi3VDoXLgA5GrAWXdmPaS/aW4+VhU7F5t7uI=;
	b=hKMmUN00iC+9dXKCV3Eom+Qq4PNCmDkd+x9rFdCgqdgHj4hP4qW5sOL9R8MrMsVI1Rzy
	 bBr15KlA4by8NXvgnvuYhaovIehPW7dhN1RRxOuafMgqKYtS0TW8Tc7jDg9J/NoZzzeMU
	 PUZggVwHl87mn8n1CVvIIFvBqlz2TiBq7I4EnCT0Hnfuo7uubMzC0+in4Rp4ra4rOQ4VJ
	 O7kV7HOOdGuVsQLxYw+5Be9Fei0mTZSp19CiYSDe4nis3TbJtJDWt1JTBJSwW2ha9TPB3
	 Xofbyyg+taLUpZy8A/DNa4CmiVe7G2kmd9zjjycawYtu4qqs4MJbuyISisPsuYPI6WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ltIECy/C";
	arc=none smtp.remote-ip=95.215.58.246
Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E686606A329
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 12:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E686606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ltIECy/C
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=LNzXwPtAzajvtYxI6EotRBLZdeMB3u0+426q1DrZgGw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793881870; v=1; x=1794486670;
 b=ltIECy/C12jSt1vfpDBaziysHNbzvhXDjM0SL4WUcV6/RvEvEibbJ+kcmk6q2r8uYrsuz+YX
 OF/lUGAO51ygILYxB9nzZF6HjSso7wZWtVhYvcIKzaX/U7JQ+VGvHoPplIFKplYi5LFXrmTZpaN
 kqUnmhR7IZJ6X6UcziKra704=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 63e722beeefc127e;
	Thu, 05 Nov 2026 12:31:08 +0000
X-Mizu-Trace-ID: 63e722beeefc127e
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 20:30:56 +0800
From: Peng Fan <peng.fan@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <aux3AIUFTEXUIbsN@fedora>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>

On Thu, Nov 05, 2026 at 11:52:59AM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
>while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
>a single "gpio" clock. The VF610 controller has no gateable clocks,
>so force clocks and clock-names false.

Sashiko reported:

[Severity: Low]
As reported by Sashiko on v2 [1], this isn't a bug, but in
Documentation/devicetree/bindings/gpio/gpio-vf610.yaml, the fsl,imx8ulp-gpio
family (including fsl,imx93-gpio, fsl,imx94-gpio, and fsl,imx95-gpio) does
not share a compatible fallback with fsl,vf610-gpio or fsl,imx7ulp-gpio, and
almost every hardware resource property now differs across the variants:


I prefer to keep the patch as it is since it has a fixes tag. But anyway
if this is not welcomed, I could separate fsl,imx8ulp-gpio into a new dt-binding
file.

Thanks
Peng

>
>Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
> .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>index a31f64b6d40b..d1d5315ee164 100644
>--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>@@ -57,11 +57,13 @@ properties:
>     maxItems: 32
> 
>   clocks:
>+    minItems: 1
>     items:
>       - description: SoC GPIO clock
>       - description: SoC PORT clock
> 
>   clock-names:
>+    minItems: 1
>     items:
>       - const: gpio
>       - const: port
>@@ -117,6 +119,45 @@ allOf:
>           items:
>             - description: GPIO register base address
> 
>+  - if:
>+      properties:
>+        compatible:
>+          const: fsl,vf610-gpio
>+    then:
>+      properties:
>+        clocks: false
>+        clock-names: false
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            const: fsl,imx7ulp-gpio
>+    then:
>+      properties:
>+        clocks:
>+          minItems: 2
>+        clock-names:
>+          minItems: 2
>+      required:
>+        - clocks
>+        - clock-names
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            const: fsl,imx8ulp-gpio
>+    then:
>+      properties:
>+        clocks:
>+          maxItems: 1
>+        clock-names:
>+          maxItems: 1
>+      required:
>+        - clocks
>+        - clock-names
>+
> additionalProperties: false
> 
> examples:
>
>-- 
>2.51.0
>
