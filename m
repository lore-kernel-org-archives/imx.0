Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48C379EDA;
	Mon, 15 Jun 2026 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549233; cv=none; b=h5hDfgFyqGS0Ncl1r+AfSccBXhNu2GYfVAeT2LhdQ0KSASAnn51Hq3O5kIt7PeTTtVj/U298nhi7eABnUY27aFcL2148l+o4wKeCSkHNB/bxAAYAgk1OSNbpBqfGWVgqYfjzLQ8sdmCjesZ14xKuJ/Pukv3s9DLuWwvehII0vAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549233; c=relaxed/simple;
	bh=ROtw0QMHSahF9zUUvC5LxY1nP1UG0Ao/sC5Iyqrkk6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdeHhz9sivZAON7sxwVxueqVc7bgLOYoXTQla+x/v/7hVBBXXD9gj2zKdSdNhDDmZVu7nEnAysVfPG5I1YlrWJoBBdy8ENYoTcBV71Ay9+1c7YSMPB5ZdYSebKCczGUI+y2Zhzbx8b0n64X13DeY1aMxg+Ne1oZtW2OZ0tD9ALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL/6g1Ai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL/6g1Ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666D81F000E9;
	Mon, 15 Jun 2026 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781549232;
	bh=1AM+L8li4N3UsWbF8Nm5adODubUGTBS+175vEjYCnXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FL/6g1Ai/tXtYu5rLh3fQ0vYbex/F+xaWdn7kleMFD8x1fJsZCfJXPwh9v/N0evJ4
	 N14re250of6XIrGotXvXqCVhxq+qurdOQOMP5MQEgizZLjyTCh0JJxvql+8zaRcZ01
	 1KC0xpN5p+bqjOvvBDnurQ4oMw6Z4NzfJqiU5xAK2i2vDmEMYb1RvtqHLeAG+Q9O+t
	 6z4Qugo0Zy+xKm+LZHoAo8AChsy67FAPtzhnP9XZauHyAovX2cYceOg/wBkK4YKPmb
	 Kds/oyL0n/vVCXwq9W8Wnm1NtSiuv0s3N4MGPtb0SQD2Rz+HAP0xk5sVvBSF2ELnN2
	 pYKA122hpHGvg==
Date: Mon, 15 Jun 2026 13:47:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <178154922879.1630652.11500293336634076421.robh@kernel.org>
References: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
 <20260610-imx93-ldb-v3-1-c9b65d742753@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-imx93-ldb-v3-1-c9b65d742753@nxp.com>


On Wed, 10 Jun 2026 17:26:21 +0800, Liu Ying wrote:
> i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
> register which control video output through a LVDS interface.  Allow the
> LVDS Display Bridge(LDB) child node and add the child node to example.
> 
> i.MX93 LDB child node(bridge@20) is an addressable node, while i.MX93
> Parallel Display Format Configuration(PDFC) child node(dpi-bridge) is a
> non-addressable node.  Mixing the addressable and non-addressable child
> nodes is allowed according to discussion [1].
> 
> Link: https://lore.kernel.org/all/n6akxiayi3g6gxcqhreb4iaohmeokoalnqup6h5r2fwdt4zijt@u2wyps55ayqm/ [1]
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

