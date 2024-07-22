Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D313770D;
	Mon, 22 Jul 2024 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721689782; cv=none; b=fT25Q6+fMsRsP6b5S4hDqWfVVVi4H5z06r4YVSFaNsBu3EQlJgDvmOHq2F1IV9jTN0+RpUTDMT/p45Cnt/njmp4lxxW2rQkb3HEEU2JK/xEQsYnm6yLpDy7zc1RFA5YkA3zx3yNsfqXcRTaqHrHt8FcfNpMusAUJ5c9joM3LRLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721689782; c=relaxed/simple;
	bh=NGlE/zK3V8uU4SAbTwuzZ3cIuKp+b5xQHGxqVgK0RKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABGYY5mOsuegyc7+hi2/6Jm5thaL9GsRCU94n1ksGzDcr3Br2rxzXi22RDrsovMo+aAq5qAxYB6U2/FHAR4niCqt5/gFAG3R8s3gCC6pbkkfUEjq49tAMHbRwkMz1rs7firtCZ0kBNTK7a8pdNLRkrudH14yX5lFO6YR4rdUpHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3il9FYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3il9FYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339C4C116B1;
	Mon, 22 Jul 2024 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721689782;
	bh=NGlE/zK3V8uU4SAbTwuzZ3cIuKp+b5xQHGxqVgK0RKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3il9FYo6wStywXVPl8yU57lWzdCYNYl4/jUfDVPP3/tWLAESEHiwAlOtnRbvmcRm
	 nagASD7zR+VkU8RDuvFUMUkIfG2dYhkEbyuUqYbImi/Ec9B12Cp415sWUnSm95Q214
	 ol1FtEwWHwTsNXsAwzJSryPP9/pEdsva0p+H4XAdCq0rcl3dmy6IJHMHiZrN6LHj5e
	 2JelYGpV4iJwiGGsmo/KvrtkPYjym/YkVFUjzlySGeYyRekvUtg3AW+Bv945Vh/nJE
	 LHGBNnwZRxhGzH5Hg0i/tghY8hjJSm0zlKpIhXgigd8/gDZUy3s+KiwZw7UmYdt1VN
	 iB8EdYy9z6rtA==
Date: Mon, 22 Jul 2024 17:09:34 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [DO NOT MERGE PATCH v2 11/16] dt-bindings: phy:
 mixel,mipi-dsi-phy: Allow assigned-clock* properties
Message-ID: <20240722230934.GA233475-robh@kernel.org>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-12-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-12-victor.liu@nxp.com>

On Fri, Jul 12, 2024 at 05:32:38PM +0800, Liu Ying wrote:
> assigned-clock* properties can be used by default now, so allow them.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * New patch as needed by MIPI/LVDS subsystems device tree.

Seems like this could go on its own, but if you don't want it merged 
then I don't need to review it.
> 
>  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> index 3c28ec50f097..286a4fcc977d 100644
> --- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> @@ -72,11 +72,6 @@ allOf:
>            contains:
>              const: fsl,imx8qxp-mipi-dphy
>      then:
> -      properties:
> -        assigned-clocks: false
> -        assigned-clock-parents: false
> -        assigned-clock-rates: false
> -
>        required:
>          - fsl,syscon
>  
> -- 
> 2.34.1
> 
