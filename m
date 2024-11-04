Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2931BF804;
	Mon,  4 Nov 2024 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735026; cv=none; b=V5sVUpi9ft6YsdZW3VNFoa1jVZ55kyI0fyMrj68kC//rqgaGCZH5Ahp8MDUQtBOgDLcwKIJYKvF7DqUnh44N0MROhxzYccbHXeqRHnEKyyl3ewY8rmP3Amv4zdd/xYfd0vm3U5eVDkgX+0yQaqlbYK+pDqqNiPb7bKUPOq8Qqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735026; c=relaxed/simple;
	bh=7Q2U9oss2EM4iM3PMEeL4JsDBihXmtIIsux04111JkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxXP3TgUIRFn/STa2+fZ6QK1Jj9rehPG5DmV4HuNi8ZTQ57W1SFFkKrBleU0nhBGJGVJlkdgCl3Em5YRpOZYnVXDM07hFHVprhl86pB6Tja3rY49Yj8xdI1dymg1IqSdM0UduZFPFtAoGKyU0nVzYqZ73rqp5YHzgblXj0WAR8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic9jv7Dm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic9jv7Dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80928C4CECE;
	Mon,  4 Nov 2024 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730735025;
	bh=7Q2U9oss2EM4iM3PMEeL4JsDBihXmtIIsux04111JkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic9jv7DmA9iiQEJ/OSVpnEdHDhlMOqfFU2nHWthRPkYDGX5yCQYB3iTbneJjq+Og5
	 rHEvIm0lzo/2tcuA0TQtO0arblv7UMeSIfL/FjM/X/ruKQ/9YgWV1p9lgTY2zn2bld
	 kbt+awZpSfPJ4NXKc6opPsuArC4xfQEi6uAPYLJPFb9eN5nZXtl+voH1rvYfqQ2MSs
	 0vQKjppQknbrmDpG2X/z+MgOfuyCF0ou63aFt9KKk9xkkhHjaduPvXuf6vh51SvrpH
	 vEMTKUFxn1smD8qPS+KkffHKfoGta2/aBhSgz7UnV3BnGF7hH+v1Q+TCkvmcN9iYQC
	 kdT1vOO0izLdg==
Date: Mon, 4 Nov 2024 09:43:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, linux-arm-kernel@lists.infradead.org,
	marex@denx.de, shawnguo@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	a.fatoum@pengutronix.de, imx@lists.linux.dev, kernel@pengutronix.de,
	krzk+dt@kernel.org, andreas@kemnade.info
Subject: Re: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Message-ID: <173073502322.211813.8204501104230548664.robh@kernel.org>
References: <20241101135406.47836-1-festevam@gmail.com>
 <20241101135406.47836-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101135406.47836-2-festevam@gmail.com>


On Fri, 01 Nov 2024 10:54:05 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - None.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

