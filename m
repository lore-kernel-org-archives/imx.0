Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094637;
	b=IhvzkyhARyUgYlLO4PRJl4fSBgDsHBH3dFj8J/ioxDTmKFrCP7FvMmp5kxVX5+Vzmew0
	 JFUdk0vJpU0D8eRnBb0WH1pBQDm1rZ9vg+b/zHnO8Ox2l6RlDzG0hPd48kAYfgtUaYEsv
	 gu5GoDc5k0pWdxFZLpnSHRPcRUskDIW15biZk1wKKAYDZ/yqU+6LLluL/d/CspX7bi1YS
	 A3QdYEFZ0CqfyI0Yxur5PYBtQgTB9leYfiv/KJZ/rSLs24zaRo3DwZzPiG+q770nGDa3Y
	 UKZkbyPuum48ilbj0xyF4dBJaFLb4sJlW7kLxPEB8fbb4XmkojXggx/JGnVfmI8hTvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094637;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vhn1wwrJeguZrNgrqIjT+wifoGu+dZ9G61eI2u7SMz8=;
	b=y+xkN4M6CYauaRSfHvt3NOv7WTD1P43jcxNGFw0Ty0f1JYYVEavry/rVgwlJMR8H8k/b
	 SkHQAYC/ahfQCiPv/Vdzsz7ifTByHQu9igh67divPP9ExYihKgt/bk9CJgCB41w5WzPVl
	 5WxPvXMrmIizXOccjuqx4y9aBJV/PJ7pbdTzlfxiNNAcmA0C4IYN4nGlWb+C0t8XyGQyg
	 2PzDvGK5ti47KoRL/IpdMlvQCGqJCufSAV1LW84alYn1hPxc0G7f5mjzeAZB8+stZ+xL5
	 YOK2iDfEzFALf6de42KuVyFpbTHyYXsXqyAXpw/DtOwBKFD523YnUZQL8/knYl8jiIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FtnhAstY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A460A263B;
	Thu, 19 Nov 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FtnhAstY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F7A1F000C4;
	Thu, 19 Nov 2026 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094637;
	bh=Vhn1wwrJeguZrNgrqIjT+wifoGu+dZ9G61eI2u7SMz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FtnhAstYuUUqTIF3QN//BoVxpeCJf8hdxH+UNKw3a+knXCj3LFH0N59lKAdb4NYbH
	 uMUpg1+Qt+ZdANR6oKOrAgTFOddKv3cxtDu+ilA7/+WdNCWXDnAZLYX6gc0ZNzNoSD
	 kpQiiKLH+IbEi54waNVLBy5HU6rXagx+Wc/s0jxGf59ajvTCJBOrtcPuLDNSbkX7Dg
	 ZBs7HPlcrSU+wLawCg7vaBuFULcHs/DHhRm1K4uMBKjIl+rPuQXdynJ0D8nSTYYdIY
	 a6uKm0LWDprt4dOtwRhHf3M7kf8Q0oQ+qJYkwJVlaM7myNAC8EA+ftDSUyxZC5hm7k
	 Y7CwiPg6stnUw==
Date: Thu, 19 Nov 2026 13:23:52 +0000
From: Simon Horman <horms@kernel.org>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: netdev@vger.kernel.org, s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/6] net: enetc: Allocate int_vector array
 dynamically
Message-ID: <20261119132352.GW860048@horms.kernel.org>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
 <8026b245b4ef8e5a4af7bb8f38e4329a9ee9caad.1794581338.git.claudiu.manoil@nxp.com>
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
In-Reply-To: <8026b245b4ef8e5a4af7bb8f38e4329a9ee9caad.1794581338.git.claudiu.manoil@nxp.com>

On Fri, Nov 13, 2026 at 05:02:33PM +0200, Claudiu Manoil wrote:
> The number of Rx/Tx ring interrupt vectors, priv->bdr_int_num, is set
> in enetc_init_si_rings_params() to the lesser of the number of online
> CPUs and the number of Rx rings of the station interface. The
> int_vector[] array in struct enetc_ndev_priv, however, has a fixed
> size of ENETC_MAX_BDR_INT (6), a limit that dates back to the maximum
> CPU count of the SoCs integrating ENETC at the time.
> 
> That assumption does not hold for S32N79, which has 8 CPUs and gives
> the ENETC PF up to 8 Rx rings. There, bdr_int_num can reach 8, and
> enetc_alloc_msix() writes priv->int_vector[i] past the end of the
> array, corrupting the adjacent fields of the netdev private area.
> No SoC currently supported upstream exceeds 6 vectors, so this is not
> reachable today; it must be fixed before S32N79 devices can be enabled
> by a following patch.
> 
> Allocate int_vector[] with devm_kcalloc() in enetc_alloc_msix(), once
> bdr_int_num is known. The memory is released together with the PCI
> device, so no explicit free is needed on the error or teardown paths.
> This is common code, so the PF and VF drivers benefit alike. Drop the
> ENETC_MAX_BDR_INT define, which only existed to size this array.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Simon Horman <horms@kernel.org>

