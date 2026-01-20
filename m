Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7083F0741;
	Tue, 20 Jan 2026 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905091; cv=none; b=u/YvQVx2gzFvxMEnEJhCSeJ+loseqYPvv+SpDeRauoV6UsIx59Knp8STSoUPtCULeFhkpJtfXVIyoNwQWO3TurjIXiAI3q3xeJGw1RUQ4n3vvyo6MR4MhVEcIyRGWyLDes3kFRD4z7mNxVNy84T7rrZuI8IA1zlhF2R76USEmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905091; c=relaxed/simple;
	bh=bJN0DSC6Ua6pKsP/DOPJJOTlRRY5NsWRrEymD+za6QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAxIKO/rf1Dh1LZuSdELnEOagocSUuH+Ck1mhgBB6EesMNB6hD+EIgxrdOepN9AjTLFxsrJ73NVfm+Zj82H/qUHuXCNUq+kunz53CpwnynjiGPPKCMY7EHyFK2yA2uaaz9RTmpN/ZlyWwGa8a/By4pMc3j0mmrWmv/p/d7q6xEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnLBqnYC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnLBqnYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE6C16AAE;
	Tue, 20 Jan 2026 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768905090;
	bh=bJN0DSC6Ua6pKsP/DOPJJOTlRRY5NsWRrEymD+za6QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnLBqnYCradIChvnsPAVk/kjMSoR0YsDiYIOor1O0d9cH9wbEnXp8CTydAOCkEgXu
	 Bvz8+eDdEFeE51Gcr6zRaGUmcEL23vGwDrATnru+LbA/emXS9oybE9d7RjiOm+y2M2
	 eEVdL+vllEgtoNTtKpbjgldvtggYDbX4IqrZMTTHaOBe2zOdfvI44O0bfj570y/jps
	 W3UuGYSyRzFBPkAP+3/apHuoq0rZgsoqRgpWnQkt472JPPtUTrJ/UbyfbyFfULhRLU
	 VWgllMGl6qeUHxoGl9+KZYH3wEDHWWR6kLgMLXDfrJYYcdRUVe+t9dgSyTVCQpvRS0
	 KerF2z2I0oooA==
Date: Tue, 20 Jan 2026 11:31:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-2-shengjiu.wang@nxp.com>

On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> There is no power domain defined on i.MX952, so make power-domains to be

There is no defined or there is no power domain? If the first, then this
patch is incomplete. Please read writing bindings part about complete
bindings. If the latter, then you miss constraints ":false" and commit
msg phrasing is incorrect (and remember that in such case you won't be
able to add power domains later because now you add complete binding).

> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Best regards,
Krzysztof

