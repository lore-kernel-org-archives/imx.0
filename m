Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C33A29B216;
	Sat, 17 Jan 2026 06:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768629833; cv=none; b=DPNnqzw9/0xMTWtv7D5tNkIM/UvF8vOcZ3boif8r8AhZjeUdFFG9iqlWeKxQ7PrtbKVYHOdSsmzxRG4zDUlZzKG6pfug8da6zhQKXBnUzG0CHrMc4vhUwh4M6ba27Jj418HJVgI32HE3bWM77kSQAteX6D3kBhV1sOZX23owcYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768629833; c=relaxed/simple;
	bh=6ddEruK33tCOrSpo624USqxMRpdHroIeTURI2A/1r6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpiOweMcS5tkiJEL3reyM1pIEPd8j4ccEJljWo0Nc6OBSp2/KRYlcuEoY7NOeG0Xkqo71o655VNjm5yL+zis2mJywH9LZmNs6oW7KNepYtTcLYV7oztHQqlh4J8jiHdwwL3szjlRLijBcTfmyYFwbDSWOU/rFNsOZlsxkh3L0hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTzQ5OCK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTzQ5OCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621E0C4CEF7;
	Sat, 17 Jan 2026 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768629833;
	bh=6ddEruK33tCOrSpo624USqxMRpdHroIeTURI2A/1r6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTzQ5OCK1lmTwJ5IWsEbSVwWH/NvKtCHbdwXWFIx77jQszzEp+1kaaxNXjUP3SYk8
	 CosM7jZez1GA87Ndx52YFs/vK0kHdwv64FqYhInBKShIUnlJxYJhEcsZtuJ2Me5ow9
	 VTi0wtx4+3RKbzdwirsS3Ll6mGN9nUhl80+ZQd9FUoKfZiZGWqjRBL2lAn+oC5TGQW
	 aCnyUhIGSr4aFezsp0FPvTMnnofUehUKl7Up3PstIPlxQhm+Z0fEJPL7ZIzfRy6w75
	 s6LAssFl7PnA0fsxjhvDTJf/P65S78Z4Ey2otkzwePsCrcCnvHE7tJdrFt7s0Kkhkd
	 887rYqOv7lvfQ==
Date: Sat, 17 Jan 2026 14:03:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/7] arm64: dts: imx952: Enable various node for
 i.MX952-EVK
Message-ID: <aWsmRNvuebqNeQQS@dragon>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>

On Mon, Jan 05, 2026 at 07:48:39PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (7):
>       arm64: dts: imx952: Add idle-states node
>       arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
>       arm64: dts: imx952-evk: Enable UART5
>       arm64: dts: imx952-evk: Enable SPI7
>       arm64: dts: imx952-evk: Enable USB[1,2]
>       arm64: dts: imx952-evk: Enable wdog3
>       arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

Applied all, thanks!
