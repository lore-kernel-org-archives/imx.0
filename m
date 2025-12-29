Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BD29408;
	Mon, 29 Dec 2025 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766998294; cv=none; b=W+Ty6D54RINk9TSEQzbOg3XJAR8ZOi6oTj4MASZgGCaslnpVOXHUz7c2/O+HO4uCDbq4Sd+6fspO9RRmA66mS6Jspu2katdjzkndBT44lpdkRVIE02/ZAZwF1dhWSFMX4aP+5asYKCVmhAstTZBcEzr5qAqYAfGaESoFLZMZd3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766998294; c=relaxed/simple;
	bh=De8M6oUwZaRM6ReeFRBncRB+CAkN4SRlPmejKl4NrD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrT7PBAiBxLHpgGW//VKhb1Qx/l3hMhUDwm8mpCDkflw3Yh9kJ+Xl1QR4q0cF3i8nHWfiMbN6nK2t5raMkodnnHDq0fZGsSBcs+Za/BAQnshccmpoQZSUGm+uu+jzYdRNTOb3gr3ccGdb9/QxL42Xo7V5k6CYQLY6ATOh8MqcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQ1nwhPQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQ1nwhPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E99AC4CEF7;
	Mon, 29 Dec 2025 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766998292;
	bh=De8M6oUwZaRM6ReeFRBncRB+CAkN4SRlPmejKl4NrD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQ1nwhPQoMfcj88rC2E6YDivr5h//MrtE5ZkanKSuYHDQ3EvjBwHXqS5iuNTuRbH8
	 FHR5hcuZIGTE+rTazLUjXkRJPFZdJ3eVCjA9DkfALQgbohLJJhEtusrkLV2L+tFWvE
	 46M3PYtnCa2V4Ml1Bwznv14KPIzNdswIZCFeCB2wXBZxCuMOPZXFoWDHnYvpjlM65E
	 VbDQ5j0fml+jDNPXT/xTpT+S+tBq9JBL+39+/8dFu50CXroM+Of+bi3vrV2PKsaxAK
	 m4kbZGs8RDz5CTXVLDCq7To+21+FFIUmXfZUChbiha5jwHkM27ccMCh9TZlHBHtleG
	 6xUFIY2J2FQJg==
Date: Mon, 29 Dec 2025 16:51:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: imx: Fix mc13xxx LED node names
Message-ID: <aVJBDxyrhCzUgTiL@dragon>
References: <20251118213551.44116-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118213551.44116-1-robh@kernel.org>

On Tue, Nov 18, 2025 at 03:35:50PM -0600, Rob Herring (Arm) wrote:
> Node names are supposed to be generic and use hexadecimal unit-addresses.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks!
