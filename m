Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751B3C3442;
	Fri, 29 May 2026 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069552; cv=none; b=DVwrsRIxggZKzkRQFcCqcxIlLgSX3DQ9E5gUqxpEJ/CKZQh6bXtZIsvrlkOJIKupDI0kXpbIuYPe/8JNtLwisfO06RribNVRW+EkYZD1kEZhTrw2bptlj2mrt4gSKIcg8wIP/u08imEi5GoZ6JY+JQrRQILlt1IjLuQMPrqzi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069552; c=relaxed/simple;
	bh=G2KF5voAhHsXsFwlvX9pJg2SGcr3a0Ny8bMXcZEE9zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL79SwWm+qWpzEBU8TLwHfYBZUl+3fjX2BtRi3ENfIbg8w7vN9iw4pgcLllW4PC7S6dN3t46N1rU9FUftNRufvAdBGbXZ+XctdteZX8fOlmojBAc/PB4i/UfyYfO+09Lk59lG9eWzpUL/Tkm7wChngWva7cz+fFj1M4HAKyWVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbOO1yPy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbOO1yPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D491F00893;
	Fri, 29 May 2026 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780069550;
	bh=eb8nb8fScTBwcXSgw+9Ix5UCDWfyVmuJGL2kWpyLZjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AbOO1yPycW9O3NJSH2EN0ltj3+bAVSFepl38eCrMztR7HEPcDhMdHnk9RF3JMRt2Q
	 CcptiCk7B9RnAMPrxYLsGVS7lQ2TnNjQieYhfu3EsGjBiqR8gNHkFifOZwgybVES9O
	 WtlWUwP8cbvXqTkV3LTqBFOyeI1qQ4RSOQfqAY7txpWrWD5A4Z1FtpJkiaXzrN0sMV
	 XWpJB4AbhiTi0bJzCFQVGn04HOuFFgMvfujIQEbRdweGWJh97JpBn0cR9Le+c8s296
	 RKzAG/gnfEE/dKtM3ceHxIerCdOPdl1yr/sdLyRJCyfZTM4ldxmaZ5KCMGQPTTQ/DV
	 H0Zj2qBkCT1Xg==
Date: Fri, 29 May 2026 17:45:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v23 3/8] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Message-ID: <20260529-aquatic-industrious-lorikeet-b81aaf@quoll>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
 <20260519-dcss-hdmi-upstreaming-v23-3-5615524a9c63@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-3-5615524a9c63@oss.nxp.com>

On Tue, May 19, 2026 at 02:42:26PM +0000, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add bindings for Freescale iMX8MQ DP and HDMI PHY.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/phy/fsl,imx8mq-hdptx-phy.yaml         | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> new file mode 100644
> index 0000000000000..b544c260aa073
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  The Cadence HDP-TX DP/HDMI PHY is a child node of the MHDP8501 bridge,
> +  sharing the same MMIO region as the parent bridge node.

As commented in bridge bindings, I have doubts in such case it is a
separate component.

Best regards,
Krzysztof

