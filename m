Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08207345CAB;
	Mon, 10 Aug 2026 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346074; cv=none; b=mfhYOiwIsk5lpPIT/Rg7Hn5fkgb0bDV9rFjHQynAZ+AxXRpfkYRizNDGBl4W7n1mvmCvdvzrasRBN1ubngZwgCfHdbcp9cv8bde/1xeT2XKuU9fwPIMXAlPDEyjwHFNSnAn/yIDZFEan27rc4zuvu3vnpZLlBE3fXtBS2WnkIEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346074; c=relaxed/simple;
	bh=r6CYbGhTQXwwrEb0UaMVKgECCiYs01A61nw9eChuU7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOJvzYGoj85FaqgHN5yBJ12ORWSGsfxIYozAYRlbREtRA7JsX9gQxvvH1Mg9qDSk2XQQyo8BbHkIvGD7qXUm6+ssG3lth5cLyp/He8sZN45i5YJ/OrTZu5uDy4gnY6V54dkoiFd6928kjPNuy8BZsn5yYkJatZf2qXvnyxQSKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7ronXcd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7ronXcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1DD1F000E9;
	Mon, 10 Aug 2026 07:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346072;
	bh=3tNAkI5vPOVX8HetVxMd0XhWn0MZflkc+mnZkRCDPdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X7ronXcdvcEuXosufT2+KbF+82VRzRQueYNYrv0YC5Isef6VGJZAU5v3WP6mwLZcq
	 5GQAxziFxT6+xFMhaN4tm8zVRzhlzet+1skX2m34LVhRnoewm+q3XqAK8hz1sMPq86
	 aE+SAHptjsCt5rJraZByYq5DR5iv+B1azs+6wbgX+BXdY+TU+DayG1YwlPTaX0n+vG
	 4uy8yPi2Gtrotr/TgpmFSXtNyc64OFkG3BA0jV7aZp1nZcJJ/raqSuvQWiPcU3VBss
	 aAORSjvJcAjsjvkq9T6s4sLCOIseteyYPwrhlB4fCfFnA5FfFPlTXp152Bv7UixqiD
	 7AUL3GPkpqpUw==
Date: Mon, 10 Aug 2026 09:14:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Message-ID: <20260810-normal-cuscus-of-argument-4b230b@quoll>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804100218.49587-2-shengjiu.wang@oss.nxp.com>

On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).

Which SoC? Did you read this binding you are changing?

> The existing binding exposed only a single generic audio-graph port,
> which cannot represent independent conversion paths when multiple pairs
> are in use simultaneously.
> 
> Add a ports container that enumerates up to three sub-ports, each
> representing an independent conversion path:
>   port@0 -- conversion path 0
>   port@1 -- conversion path 1
>   port@2 -- conversion path 2
> 
> Each sub-port references audio-graph-port.yaml as before. Hardware pairs
> are allocated dynamically at stream open time; each active stream
> direction (playback or capture) on a port consumes one hardware pair.
> 
> For backwards compatibility, keep the old single port property but mark

Why? Did the old hardware change that it has more ports/paths?

> it deprecated. A schema constraint (not: required: [port, ports]) ensures
> that both forms cannot be used at the same time. The binding example is
> updated to show the preferred ports form.
> 
> No existing upstream DTS file for fsl,imx-asrc uses the previously
> documented single 'port' node, so this change does not break any
> in-tree device tree.

Does it break other users of this binding?

Why mentioning upstream in the first place? Either this change breaks
ABI or not, explain that.


Best regards,
Krzysztof

