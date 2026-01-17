Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C332A3C5;
	Sat, 17 Jan 2026 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768633807; cv=none; b=DqUU5oDmXrWgTeuWw/jKDL95B7Ai7TGrbzW6Lc5R54pB/2+vsxOATH5H9HG/04kTfgBP5qS4mPHYPmLEQiEEutcsM26JEAnKQepXBpQwqQCsMFFLqedm5cMbWK/G15ew448VREgpJgFuSU0B0QrneUIwTznylTWpq8xw0mz3pjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768633807; c=relaxed/simple;
	bh=S+0qHwaPdddN+HAy8Hl9ev2pzcJRpYE9R9HSF6mkT34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRp928Wy1jMKak8cgP9c3tIiw/Kh5582E0SD+L3ITyg4gpKz51n4zG3E9bAI5u87It/q8hja9cLZCMc6VsP40Xc4p5uy5KJysrLWxLJAzxrNlFthSJhmltQ0dDJ4tKdVYm//Rt/mbnTNc09H7B2S5JxXxEWpwLHilG1+YU63bJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9YGs8DR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9YGs8DR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080FDC4CEF7;
	Sat, 17 Jan 2026 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768633806;
	bh=S+0qHwaPdddN+HAy8Hl9ev2pzcJRpYE9R9HSF6mkT34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9YGs8DRLEadDeaIruOG+ZlVhlCdaSfNaPFW8kYC4xQT7i4zWqtsfLe4Cxos/S4rU
	 tp4xqfVaRJcxuU8MxnfOqf9XX3RpM/uZ5iVj3NDurfomto0G0cqnwN4SN/0JEGs36u
	 II7PrNqdaL41wn2WHSrUWXan1hrwuSTPRkvjsvjvq+6L6bxgd75kOKyn9qn1BWEXCg
	 6cEv5GRWxNR4+PtzB3bE7AtvrMRmzHQmUEl5OX4XaRie5xePgymfHsTLfZnd3HPcU2
	 7ogG8wmkEf/jeCTqjrGkxtmAs5kA6AbuDd/AUXcgW9bKrCZ9VD50+L08vkXiyw5s+4
	 OeUluzBu/pxXQ==
Date: Sat, 17 Jan 2026 15:09:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: sebastian.krzyszkowiak@puri.sm
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm,
	Denis Sergeevich <galilley@gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: imx8mq-librem5: Various improvements for
 Librem 5
Message-ID: <aWs1xH573_x3-cGq@dragon>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>

On Mon, Jan 05, 2026 at 09:39:37PM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
> Sebastian Krzyszkowiak (6):
>       arm64: dts: imx8mq-librem5: Enable I2C recovery
>       arm64: dts: imx8mq-librem5: Set vibrator's PWM frequency to 20kHz
>       arm64: dts: imx8mq-librem5: Enable SNVS RTC
>       arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency to 50MHz
>       arm64: dts: imx8mq-librem5: Set cap-power-off-card for usdhc2
>       arm64: dts: imx8mq-librem5: Don't set mic-cfg for wm8962

Applied all, thanks!
