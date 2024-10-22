Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3017F41760
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 03:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729567645; cv=none; b=G09OOvWFjo97LfQHQ0Dmh1q53at1ht7b2+MFPPtwXrVQU6jFZGhnlaC6pPBApAvUlByqtKLE86HM4fm3sZXikCu+mcAIXKkOKk4UNPippgUBRUJ+HZKw9/P9Jef81dJptbkSWCIdu8onqkfsBQka5ot1FmH3kou5AdCloKeCeyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729567645; c=relaxed/simple;
	bh=5E/MUIWR/Iyu+JIdQ/r/WMUE9ombsVBOFdb/G/DxTYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZjK6Hag7lnryJiuzh/jZz+1t1Ip+LWBIqUnIjsywvwdneP4zzpDWTtY8iClpAIWGegYzkQEwB7Jz8CWadcNqLvyCLY6lghKAzbmpGTljX7R6OBMb8ddelchxsr7Q8kkwu3naQZEWz1tT2uo5p6nDUFld14Hralnr+ID9l70kBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CkdjjShL; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CkdjjShL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dkDU2h6uW+xJKLl9ZR9Wm9eDWO5GXIm5Do45ucbhOLg=;
	b=CkdjjShLW0crzKcz4i7Pe3NeRQcu5dh7LAZ9xHowsCuZYpCp8SSBNHr+1VTRV1
	+WR5INlGK3Y0M56zBpb6q0xlSbKBDNLKhp2s3MqVXzPKLcO72J45FpqxPP6ozMk4
	vf+I0wzHe3eLEqPNa7NVAnNTJZtq8pR0Mts/VPcA+Rnls=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnrfWCGxdnpbOUAA--.5406S3;
	Tue, 22 Oct 2024 11:27:00 +0800 (CST)
Date: Tue, 22 Oct 2024 11:26:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: WangYuli <wangyuli@uniontech.com>
Cc: robh@kernel.org, saravanak@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, horms@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	philippe.schenker@toradex.com
Subject: Re: [PATCH] arm64: dts: colibri-imx8x: Fix typo "rewritting"
Message-ID: <ZxcbggAgGx67+xsX@dragon>
References: <45F06B5D4CA9F444+20241018023340.47617-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45F06B5D4CA9F444+20241018023340.47617-1-wangyuli@uniontech.com>
X-CM-TRANSID:Mc8vCgDnrfWCGxdnpbOUAA--.5406S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVco2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxCAZWcXFXIWFAAAsr

On Fri, Oct 18, 2024 at 10:33:40AM +0800, WangYuli wrote:
> There is a spelling mistake of 'rewritting' in comments which
> should be 'rewriting'.
> 
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Applied, thanks!

