Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAF304968;
	Tue, 30 Dec 2025 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083094; cv=none; b=Obv+yvkS31Txdz4cpVLVTrq8O0suENGwAq0XgMqMYMO6wLW2WNxoZ7X3fvCJOnYS3aYcsdp0LE5rLVaSzIXFJ7NIIaFJYT+a++wmYwTw11MRlVJ9dLvlLaVHhLdk8Y1DS8sWX800zawMy3EsOTha4x3DNALxtCh8Q0XQPqPBOE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083094; c=relaxed/simple;
	bh=IA1k12UgLIS1u8d+vnsFBGqml4AHHe5zW320c+g6a8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRL797tTQTrHTdz1LESUFyWKmL/s7QfvBN5Y4gdw5UTL1OSKQVm3hfRDaCjCcO1hXk8mXnqOg02EDjpPoW5QkThfdo2jXm6FikP/X6lzPRfg67yGTvoMCsxK3sl/A7KYi3Y2Gq6RNsXql4f4TRkndICwYat6j8xAsu8Y+nQuraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmPGOcl/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmPGOcl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D35FC4CEFB;
	Tue, 30 Dec 2025 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083094;
	bh=IA1k12UgLIS1u8d+vnsFBGqml4AHHe5zW320c+g6a8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmPGOcl/vnaajXN1b0gJNxCgG4/zODZVA8DDOcq2tMRy0Mr537nthtPQAjL5m6TFF
	 /SzcgDenr84FowcZTv0iK66w5elm2+1sIUOl/f4C2q3jkk9WMufpRhmctMKNLhs7JE
	 /isQF/RfbwlLFf+S25sV00h6WgG2sts42mkd034D1O8JSB4WYAkbRfYI+9OoatSWTy
	 aiNEIcXgCowiZAYa9fKdIqaZmZDmgg40dK5GKA1xQPTvyjk91Fuz/6pEHt5lzXydpM
	 +hTerLCDV1JvGMAIDf5YSHVhxUZhoL2Gb1fqIEgGOJhe7bu9jyh8pdhUx8yGxb/unJ
	 8/Y4fCkep65rQ==
Date: Tue, 30 Dec 2025 16:24:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: imx8mn-tqma8mqnl: remove virtual 3.3V
 regulator
Message-ID: <aVOMUUfMIgBfn9NR@dragon>
References: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>

On Tue, Dec 16, 2025 at 02:39:23PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> BUCK4 rail supplies the 3.3V rail. Use the actual regulator
> instead of a virtual fixed regulator.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!
