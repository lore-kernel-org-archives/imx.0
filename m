Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068031DB356;
	Sat, 17 Jan 2026 02:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768617603; cv=none; b=OLAeMLxSx4J96ukGY8wcnc2n1iVm80345lhqZe8HEIli8EwlZPHqW0OE3HQT/PBrJrP428z6fB0+8XKQHl7aEkHNIU4tqgwqFZhyDztCOjgPo+tCDk1UcY6l0zwXwtOBWZsecbvs6PHXCIYBt2NjAAMsa0s0YkI8MQOi+z6rlCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768617603; c=relaxed/simple;
	bh=Oo9C9eIHexmndWqq4weLNVea2ly8DZIkz1rKY/arHW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6oll9COeOLicAvFjNYRAxd4s6NY7R1MRanMOCtNVb3+TEg04HY2EFuqEmF+xNNqOK6GSVN6Idd1j9KN4iyDBEL5A8ARR0YjIoXhwy1q4OUjJpUMR8BFUSAGD4JpD1yRuUbzTEXPn0qk58tMcNVGAyfHK7Coa/SyaU86cDZF5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZVolOei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZVolOei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58579C116C6;
	Sat, 17 Jan 2026 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768617601;
	bh=Oo9C9eIHexmndWqq4weLNVea2ly8DZIkz1rKY/arHW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZVolOei8IUUJfVrVLMpDxlMCNlxuLKvN59rLMO3Mll/KZU4DhUoMwLssNnz9jjbW
	 WIPiE1tz8Uw6zaKniVdcSCXOcem8qxL7DL+qH5cUh1XGBzMsva5+tWnziEqhTmHteY
	 HVCSZfNfV0Zet5CU+32hbqKwLdZab8bPnXhaTfDaOsN0oGWXxnt96+D7BofSZPyLfo
	 jIaGAn0ReCrZzCAlIbqXKhQZfHI6fxcd9qeDQr9S0Gzd/5B7MmEQGl4DisrJyKbwk9
	 Y1oEp7RsR/CVv5903c84N93SrrAOW4lRabPHzJnXbymGpwU+XVBnBBlYGCywL8/WMq
	 dk4m2rAa0QXtA==
Date: Sat, 17 Jan 2026 10:39:55 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: imx: cleanup most gpmi related CHECK_DTB
 warning
Message-ID: <aWr2e7xwVM6Im1XR@dragon>
References: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>

On Tue, Nov 04, 2025 at 05:27:11PM -0500, Frank Li wrote:
> Frank Li (3):
>       ARM: dts: imx6qdl: add '#address-cells' and '#size-cells' for gpmi-nand
>       ARM: dts: imx6sx: update gpmi #size-cells to 0
>       ARM: dts: imx: move nand related property under nand@0

Applied all, thanks!
