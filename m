Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3810C330B15;
	Thu, 16 Jul 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205446; cv=none; b=f0hyP9DJ4SIZaWOtBr3Nhbp4mMqPMz3n43J8FtYg5+aZbE3xU7Ez67AkCBgysjh+45M1sP336q4co6/WLF6PUA8VDKFJ0urzIQAslI2GMK4YUYXV3E1M9kRt7KMMqohA1cq6cp/D+ECQ5hN08mSphEQA1g1vuCQ714U+I574VaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205446; c=relaxed/simple;
	bh=AQy2/HTVLHqXhomQNwRYqzI1RTOD7hqOK0fwuURxblw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pezU/DK85X9l0XD8itT3d7Sh/47TB+iRWnT5Iw1DvGjyqEpWeRJddLT8vB4uvgppVqInJBvI5N+/GdL0LJy6pueI3PxQH6wyMTHzhtUDdCpQ4zQkisnVwv+94Ng2IxgdD3xCH2onNU+wL0aH9nB6BRsvyXNoEQhKLr/Lr722ZeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hcumvihs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hcumvihs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041EC1F00A3A;
	Thu, 16 Jul 2026 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784205444;
	bh=jvZU34hVR18uwXsCqsccdKkWSe8qIC0D/7BHu7+fEIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HcumvihsdX9y/RwD9GPro51qfsAPRYPYeMlKd0H+MnGKMkPh/pR6iwabDXuUQuNTQ
	 9N580m+l8p9FyOPkiZhJajmzrLy2KGq80UBAo06qOCHItmB/38pk3sXNjmAyQ2n98z
	 dMlewxSQ4rawlsVji5EUwWzg2SNm6zlx08XKZiAZR/euS4baxfJIQC9LbLQJ/7UTb+
	 xZ+WNNRA1o0VUKeW+VB1EfRTf0BBuN7yUyWYqHFXABh5aZNDa9Ugo82aEI7FqB02Bf
	 P/7fg0884O7OtdOfCL34xi8rHtaYMbHOmQ+FgVQ8BjutgokOURQG9rBgf2VrhYx7zi
	 cay6wYLLdEgag==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
References: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
Subject: Re: (subset) [PATCH v3 1/1] dt-bindings: mfd: st,stmpe: fix typo
 st,stmpe601 (should be st,stmpe610)
Message-Id: <178420544173.1331431.4812862969734538129.b4-ty@b4>
Date: Thu, 16 Jul 2026 13:37:21 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 06 Jul 2026 15:29:32 -0400, Frank.Li@oss.nxp.com wrote:
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
> 
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601 (should be st,stmpe610)
      commit: 57f3718680c0e976ef23fd7a7fa586d5b065d42f

--
Lee Jones [李琼斯]

