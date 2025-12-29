Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF6D2AD0C;
	Mon, 29 Dec 2025 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012344; cv=none; b=iN6O0dBP61BnojIRG7yxhwhguMtslTacfvAHN+dadhD4HBPX4feen8EVjzlaC5jetwoZfO5AdwZjkWyhg6gEFXQVTvzTZd2KUQovjRwEVYGoobifHj6yXdKH0ipmypZbcRk9HzSinHgYoYYp52Lfs+TtUXLXqBtEj0xDmqlJmEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012344; c=relaxed/simple;
	bh=ppvgd/s8wvK+A0YDWqm9HszRKuwc9xFTsTgQi0kIFOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUAuLPNPbwWbtScNXOxiDwphmVLfd6pHPNDLycPh3e6XP5q2u11VUDmP8JEzHmn77eCvVuOn5bRSvlv08XQ3YvLd11/mThkmRmE+Z5TiLJmtRkA2Dg883VeG3ndad5pOJCyzqyaC5mhXJE4DDcajGJaARtcOsY5vxRndSfB/wHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEg/gIqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEg/gIqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E53C4CEF7;
	Mon, 29 Dec 2025 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012344;
	bh=ppvgd/s8wvK+A0YDWqm9HszRKuwc9xFTsTgQi0kIFOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEg/gIqtUk64VpEQIXk1OBXy4EsiPX73QhRG5+4YyVjKDan+7MWbXyFcRnSi4ApLK
	 7AOExY0fJsPBXh/Myrhe23jnt6aZewikrjs/Tts1lDbN1JWH0YOz+Owhi/8MA3pYps
	 LU2nwn21u7VT14jwHnIqi6Vr0SrgUOqCy4046PkVqNlJ/CwrsP4zhEkbrAtOyYfYxX
	 sEkFGFWtKwKqAPLBYw+nU/srfB1piOST6yb5rs6iaAaA016tL5nlt9Hpwc0zLcvEME
	 UAgqZSIXz74FaCA+rv3aMeT55TCGtzLKvodeg0ew0EYHaMvZPbGx9kcb6v+3tEC+EC
	 bUbiReHC5vxVQ==
Date: Mon, 29 Dec 2025 20:45:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8qxp-mek: Add sensors under i2c1
 bus
Message-ID: <aVJ3895nxmH_M8au@dragon>
References: <20251120215350.352117-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120215350.352117-1-Frank.Li@nxp.com>

On Thu, Nov 20, 2025 at 04:53:50PM -0500, Frank Li wrote:
> Add sensors under i2c1 bus.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!
