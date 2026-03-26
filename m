Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F837B3F7
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515508; cv=none; b=Iz01ou5EjX5JqnPWXFvv3yjlZDZ3hsPSxm9vITtt5yhIjYgfsEg66/4Fbt2A20Jq2uIZqQAlnmmVdccM/VynbXS1SjtVxcEmNANgmP9C8ykSHZoUnscx66W9q+G9zEJ/q2Yn9xuMkiNVBCVJ3Efntwa27KQLmhxKfGgWTkeZKB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515508; c=relaxed/simple;
	bh=QSCkfnKsrDZTYKx1YNAx8qrghSr/qzKl+1Bjc1+JQgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KO46+3zoN2tSWxrTG/fUj2+uGt9mQEhXf1InvVADevVNn4Be9aco+Kf0m3SLCUH01OfyARF64Ij91bJ5I8tR3fTLW9+9IO33tP3xXhQGQKXxyanxASySQoXwOyCxrbIYf6rbSDF2/ktxovq/EoBgFcflF+vKBgzJi/14acS/7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uw8Ty48R; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uw8Ty48R"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c6fc2910so415750f8f.0
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515505; x=1775120305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=Uw8Ty48RtQsPiML+7EeJT8IGbLtv9kpeCRLab+JVCfoQyBuoXFd4lFBlx/jlj7VOD1
         OjIWDDFKEfWjTPXEY9hFMFPJAUcOpzQ9IBWvs62cq1jWQOShbSAvwMQKrWuD8CfT4u5O
         +yBcmTMwvfKk7AlEER8G1q0uF+74SrCNzGoZM/5gY8ndqcFggLa6apfZnMz2sAiveBz2
         5zmcVrVg+vICzC49R1j/Ej5Tj/ZdkTEtyW6QtRfoi8yeIJC+uRblFUskoKFWESFmyXA3
         19L4htYYxmL4tMjh4Xb+fv5FJXKLEvAIb+R1FXSeIaFiaQHPlXjTxNPHsNhfezv1tOff
         BjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515505; x=1775120305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=pli3iHDnLXCrV5l6aG0Jwg0cfnd0D+wESXWGzJnL7iz5e+AOEzalOi+6yeoFhbjJFV
         +0+A4bbM1m8QDGOx/A8JRgmrMAxzjc7pYbUXtuYXxyLbDfHG4Hi+0aJEHfpordEB5jLQ
         hKA2icIY3yo91lcqk0UHsNTJWW7yPHNbABIlOl9TzaLXJx6EEErz8G7gvyYoYIJ/3HDv
         tcLrSk599KBqhDb+PGxIcqqlH03ktpraVEfjhJgt3/c85cbptP4zKFYpNeL37KAFEp7Q
         ouwjzDAH30ekJHz4dzNaGIWBSyeuFUp2znj8Cua0N1PJe8GmnnFskBoG5x8FTtT7GrSM
         Jy/w==
X-Forwarded-Encrypted: i=1; AJvYcCXeugFTSmAVCpYYAeYLUxbxNhvoCPcx0UZZfjSg0qzFYiwklS9Pr95NJ6WUORu5jjJ33q4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEgkGpxoLbYZRtJcyJrT6nIYbj4Hbt48XdCiavvc80Iu3BZNLg
	5pMBIYafAm5gsv3u8YY45RgwQ1a8cHBnDhTSk1LaORsdHp2hYNooHeFIv1pqMPCDqlc=
X-Gm-Gg: ATEYQzz/mufkVV4t65yWqoK8KAhe26OeGE4dsS5EDY+SPRFU2/Xi2+DH6WvN1yIxnD6
	ffrlUp/SO1IvQp7UN5yEcsF2iwpMTGSIhylsn0jsw7LQ5p0wKTiwyK+SFUlVDAL0SgBh7gn7fUr
	BdzQZ2/kNFfA3zcyw1czJ3VOp9xvlrJxg/Ejomr8L7QBH8lkDnyHwKVcBqQJERRU5TgXiM92XIw
	P92Qu4DNyZ8cDBihSF/FMfegDEzzOc9vZ5oavahRXUsiN+ZTR/u6lRnBSjkbiBzVCj4rGa8M01M
	DjoiuxDBS3WU+DpR4l7ico6YMixUBnqMhwiqr48XfWkF6xRZdo/53ukPGPORDxydJjIIfJDSfpW
	YQH++NcR8WwbnMqylP5vbQQQ7tqpjKrBwzIMPYH/6QcYt1/w/CEI/wEYJSgeKFOb5HKmDqJIedW
	Zrx3lffOxGBd8CA5syo+UuU31lp9iFtpBXujhu4CF8JHrT
X-Received: by 2002:a05:6000:2885:b0:43b:4881:cee with SMTP id ffacd0b85a97d-43b8899d440mr10250351f8f.1.1774515504858;
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e708asm5849382f8f.36.2026.03.26.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
 Marc Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI
 interrupts
Message-Id: <177451550396.95191.10019790997295547194.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 09:58:23 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/amlogic/c/ff6c02a40dc8706c0b13b3b12cfe228c38bb7857

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

