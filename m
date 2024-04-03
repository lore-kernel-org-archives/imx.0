Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944EAE56E
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712107270; cv=none; b=I1ZICetGnQ5mvUKRUlOXQ2xBftbG24pUVqCQ7R0TeeaqAOZDqjfn1623T6lvPWmDpP/jupOnx+GbeiuD412EZuZXGyNY9Mvd/gbHDeAvyTo7hOBbPBjHmS7+NO2/ObRtvxTpncTPusZCpOe3wyxg8fLnzGXB09gfFldfe1VqvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712107270; c=relaxed/simple;
	bh=xf/E2qjc1NZRzpvxjNCkw0yuOBO85KFVg2XRoKCWyMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9CAj+3vt+SPVYg8R31OW9D7YlLwdMq2PKyCK+gS7+kVLbg1wNHeBtTgfTAkooyrXW97FY6OVkueSkp5g9IG05Y5F9GVzQjUki95W++WoTdC5gHnoKpDtQ0fzH1qY1YqM01pOmblZQu/mMi9OXBUe5ZGhDSrD97SYU2R/Tr0IhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JEwUMb4E; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JEwUMb4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sArve/j6wLVovttQ89uc7gsa2kSjnfAK0w4Il26KCUw=;
	b=JEwUMb4ExLNo3P132mcEJpuzbA99Sb1pbwTjm3BLGicgFBfNhE9xFS/0Y5pBHB
	9RfQdUGV9z7wFBXplIbYk3ZknSb8tQn7OgdLyNKZ3SPYJraDRdY3U+iU3gtEArl7
	I8GvHAbE5b6i1s4KzFMMJgdsFdc9RSo4cD8FIS//k6ods=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAD3v0LtrgxmbkmtAQ--.49750S3;
	Wed, 03 Apr 2024 09:20:47 +0800 (CST)
Date: Wed, 3 Apr 2024 09:20:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] arm64: dts: imx8m*-venice-gw7: Fix TPM schema violations
Message-ID: <Zgyu7c3BQlqTexPJ@dragon>
References: <20240402193355.2333597-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402193355.2333597-1-tharvey@gateworks.com>
X-CM-TRANSID:ClUQrAD3v0LtrgxmbkmtAQ--.49750S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruw13uF4ktFyxtr4rAw13Jwb_yoWxtwb_Ca
	97X348KrW5ur18Gr1UtF45XFZYga47Kr9rJryDtw1jv3sYvFZ5Gr9Yy3s8Zw45ZF4YgFnr
	uryxJFWrA3y29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0_pnJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDxO1ZVnxcmgkhwAAsd

On Tue, Apr 02, 2024 at 12:33:55PM -0700, Tim Harvey wrote:
> Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> bindings"), several issues are reported by "make dtbs_check" for arm64
> devicetrees:
> 
> The compatible property needs to contain the chip's name in addition to
> the generic "tcg,tpm_tis-spi".
> 
> tpm@1: compatible: ['tcg,tpm_tis-spi'] is too short
> 	from schema $id:
> http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml#
> 
> Fix these schema violations.
> 
> Gateworks Venice uses an Atmel ATTPM20P:
> https://trac.gateworks.com/wiki/tpm
> 
> Cc: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

