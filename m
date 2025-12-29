Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888C31354A;
	Mon, 29 Dec 2025 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013778; cv=none; b=XlVLEJh9OiD+cZwpquqZX4Gf2KPoGZkyT2FEJd1qnBWuneiK7ZsHftwUfq4G+6a11ZNkVN5jSR8LMm3HUboMLQU5pDizuaGXzVc/jjeDHA75+Zkkc9/+VV6AZIz/sbxHsXEv7uRq6DEYovrjeptA6KLzDWDj9RXHmjY7qWqk2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013778; c=relaxed/simple;
	bh=nzLRz3vZ4BiKjALouM+hKrGdDvWh3eCUoAQRpP2rE5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZVp5Jt2jIxLrz67Cd0gZX/mBe1sygconuZH6qV9g/k7pvCsdXZoC5yUZam6/mwT2j6tc6GiOdsiCTOoaX4/pMiYF/ten9xuX1eedtYok0AuGOxFxPLrsrJCVCRUGuWH5i2tZ8mUfJRD+ogb9hppwgVdhhrbMro7SLNfnqs6m7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDWPsXeZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDWPsXeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441E9C4CEF7;
	Mon, 29 Dec 2025 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013777;
	bh=nzLRz3vZ4BiKjALouM+hKrGdDvWh3eCUoAQRpP2rE5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDWPsXeZ2Peas+nu9CwAOau65ia92X2PM3VfKtU19Do75GQ+2kM6u7TJRqMFKcMz3
	 ogC4Nm8euvhyl4DIPPIv9yoLOVElnm7IjlPGi8dk5WjF3X4GxPschpJGJ9vEhzOMUh
	 RQtfX7rZ8loUVCGs81QzsvQHhFOON1q56JDEakYVUzE9wJIkEEAaWk+tR19TYMTsTE
	 xIemkEOnQM//LTT5bPq7IBal5izNYjwubyJ/FRtyeDfJN7GsRy6OFcB7gkTbfKm22k
	 Y2Jr8NxJiIlnUPIGrqfNdrYY3c7xsmqQ0FEGZbLTD/3tt0kYZx8Z8Ko7UT6BjoDw3k
	 nZy8xP+kRu4qA==
Date: Mon, 29 Dec 2025 21:09:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8ulp: add sim lpav node
Message-ID: <aVJ9hngpYQg5c123@dragon>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
 <20251126124218.803-6-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126124218.803-6-laurentiumihalcea111@gmail.com>

On Wed, Nov 26, 2025 at 04:42:18AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DT node for the SIM LPAV module.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Applied, thanks!
