Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502091DF748;
	Sat, 15 Nov 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763207642; cv=none; b=mPRQOIKuATYELRqtDWJUOkVyr3EtSJ3s0tVsYhVUn6YYbxmd/jwlEaxkz+JcoIUPOgtD6NvCHheNjTP/5qUQ++6k/kDhWnmzXO9v6aivVj9l+xJcz9WG+kLdTGfpGpoyi87JdXB6LCOm4KRXd8VfOwM4uUkdExa+02xcIW+9wGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763207642; c=relaxed/simple;
	bh=SFB7UaLZKoJrkoVjVZhNqv3hZFUKGA+4m7Bp1LsdL2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMZZdqqbjqqCZUJK9h/qdXEChPFplhjTFAIRxFVn5yoTX26bWBZ3UQ9qG/zbSkCdJX5ELtxwBFe+jjYeZHN/fXumDxe1OS5Z2Yp+Kd9jqHRCKVEq/1k14MBaG9g7aY+/728qKwA6snVskC6oK4rnmXY6NLsDi9iMKF/cHz4c5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOMX0Fj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOMX0Fj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B10C4CEF8;
	Sat, 15 Nov 2025 11:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763207641;
	bh=SFB7UaLZKoJrkoVjVZhNqv3hZFUKGA+4m7Bp1LsdL2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOMX0Fj3iIPiDVFtVpxagbIGgwOwiXzYHeNfDxdzn3Y+Drgoad1nvs/ZVmSQjT8Z1
	 1ILqDkPZgBPFl5NIhf6jgWLbKGTp5ifd9Aa0BwwubeY8Sn+v8OnkBJovhA5ba1kQOu
	 EhGYVfZQE1G9gebiPQI8/JwqLQ/bZS5Z7GqDVxu/BOnEgF4/lCH+XpC0V7wNxrdV1S
	 tPgJQViGcYmbfV7ddftluG2Bt6mSFnzcg1CAxf45RBfSfukQvPBhASjJeY79G8YxMD
	 Nf3+0+dbw8/tiB1P0kyhnmvTM+GCNU7MHmKhznPNGoi3edo6dDmVeVvAfIO8jxxRmG
	 kqOvyxMxqvcbw==
Date: Sat, 15 Nov 2025 12:53:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: freescale: moduline-display: fix
 compatible
Message-ID: <20251115-spicy-gifted-newt-3644ec@kuoka>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
 <20251114-disp_fix-v1-2-49cbe826afc2@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-disp_fix-v1-2-49cbe826afc2@gocontroll.com>

On Fri, Nov 14, 2025 at 03:11:50PM +0100, Maud Spierings wrote:
> The compatibles should include the SoM compatible, this board is based
> on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
> the board compatible.
> 
> This is a breaking change, but it is early enough that it can be
> corrected without causing any issues.

You did not describe what is here wrong that it needs a correction.

Best regards,
Krzysztof

