Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F8632;
	Tue, 30 Dec 2025 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083440; cv=none; b=KfAw0L89Dk4cIhMv6RodD0WYu5TAAuOmhwcAGusWazZriHzv4UTJ7+Q98Rk9wHoymGEtV6oaQ+4hecHxIkNDezkIphgI8boWzA9LAixn1suZ+AQkc/eA4tzG6LqjPpr0jAspUlumR0UcjN6qAYn0wLrz6fmsT4LpW6zXpeJvidE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083440; c=relaxed/simple;
	bh=6+4hcyKs8Ymf4oWdbMF9mQ98nLVcjC0b5v4lZAALdj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufNjjQtizXy3zjAHfrmSWUEEaPmr0aML2KvTPN+Nn5o0asiE3G73uHJOZ1xkyi69xMKpZ+1H32Dtfi+jfTWs9CpEIkyzWI3F/TbGbJ9peWN7L7a4assd6tLQB+HjiSNwHc13DizpbF8C+trsZPA7bQZyNS6/rS1LQxj4Zna7src=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgHEBH/x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgHEBH/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC6BC4CEFB;
	Tue, 30 Dec 2025 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083440;
	bh=6+4hcyKs8Ymf4oWdbMF9mQ98nLVcjC0b5v4lZAALdj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgHEBH/x4S3RSpFxF3Z8rG8oMKJW/nApb4fKeYuTS1d5efEyuEfg8MgXTR3ltwn6R
	 Z2BsB+d9PseMFU2c1a2kZPDoAit6uAfiaL+1P50MV14Rzp5Sn+oizVioGZzj0ZTp0/
	 o1hbqwll+K0wQzQJFMeREEj7eweKyEX2oSQCSwpqFZFJBH6PIx6hW6YwjQDkPqCUYG
	 CKhFKnzR5ujIeB/zbCvJOrT7y5wcGraLrArsJYWFpwzyJI8Acmdvw+ILwgeCozFcSR
	 W8bWo+WA/1tQkMtLrwNCtJ8JI379rZedFuweSTlt2o087U/xoWC1ObgWDsA9wCLk9k
	 YAuEymA11pcIQ==
Date: Tue, 30 Dec 2025 16:30:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: mb-smarc-2: Add PCIe support
Message-ID: <aVONq0pHbzhQABZ0@dragon>
References: <20251217084806.41853-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217084806.41853-1-alexander.stein@ew.tq-group.com>

On Wed, Dec 17, 2025 at 09:48:04AM +0100, Alexander Stein wrote:
> TQMa8XxS on MB-SMARC-2 supports mPCIe on X44.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!
