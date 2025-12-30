Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDED1F30BB;
	Tue, 30 Dec 2025 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083010; cv=none; b=j4LMPetATfJPY4FFDyN3epGFePCpERv+H5UfFauJxfPC1klzZnPdpvhtsaMOKZlu7I4c9ako5tiL5mvgq24HBAR6XPIUTiomPEUOSuvC6xJzs9R8elv8lvcKEFgzLcc+LB6DozRq2TAManmFDaeoCXTR8lykgS7tczwbEquh0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083010; c=relaxed/simple;
	bh=CBSNqPUfBsonpQprSCEMmf52XfKbGB0nMPiewYw9A24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2XidSNepQL9zkkIbShaLLbmD5RWOAZ5XGZ4iOl4D1ta0TDyuI7wKk8OWfyJfPh8hb9evz+Scl4r72pgPqhksHNYWN+csctsadUqG3kuZEQbhYvs8fbNW1zI9atketpIsuRdizdX+5FJPXVrpKrHDO/ZgE9aOrH/cnqRro6LOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svcrcOA6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svcrcOA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073DBC4CEFB;
	Tue, 30 Dec 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083010;
	bh=CBSNqPUfBsonpQprSCEMmf52XfKbGB0nMPiewYw9A24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svcrcOA6caumjQ+6+BYNwp/0FgyDszntytFs+x4h1z6C/31KtJVt+MlduTVfSoalO
	 z4g3xC3iN4yTrelbaA+4D8kO2KU8x82yOQHAjD4vyjB84NP92qrOsFJiBRUFOpZc+R
	 z6+/aOIuNhaleiPJe0NpOG0XQO5TO8fIJlRY2UB1YJMb4Iw29KzbGnUilRcXJz/kal
	 1B5S47EKTmPUaW3RUr+785hDRHOM6HoZM5YTfB1YGT/K+dyUjXsM7vjKT+6opffJdU
	 hlYjTAOtIx0X3U/UzsMvpAcYePuxwYcokuDM3EY9/vg/MBBhWem1PIzAcPTvyWP8xX
	 KA6Uyv6TGaY/A==
Date: Tue, 30 Dec 2025 16:23:20 +0800
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
Subject: Re: [PATCH 1/4] arm64: dts: imx8mm-tqma8mqml: remove virtual 3.3V
 regulator
Message-ID: <aVOL-NbrSOme1_P9@dragon>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>

On Tue, Dec 16, 2025 at 02:31:04PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> BUCK4 rail supplies the 3.3V rail. Use the actual regulator
> instead of a virtual fixed regulator.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!
