Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D31D63F9
	for <imx@lists.linux.dev>; Sat,  1 Mar 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740823445; cv=none; b=j09znvQEf/Xt3Z647pQkdh8tLIDo8xQ0sXhClqS033O61gxVl4cNGKh9YP6tAKx1e4oZq9WOLfj9ib2GZiQz/0fbmATDX4TfI2+c0AyxUyIaLfZYrAB9BZO4FzJH4Suz3HwPfFnDhkru95PvYzx8HLFmPXqStR7LExjKsI9GTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740823445; c=relaxed/simple;
	bh=ed0rxhmjszvCD6sXc1nM0sLqEzWbX15UwVBTYrlX7o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paGwE0z9RWhuewri+bJzwanRUuBfxfLFPihLyJOL0X/PQYUjVmg0oQVEqW3wy3vqqWCwgyM52Ez6TsdlcTuO4tiwl/VSTejbrwCsW513qkdeRHsOxydEY7te04d+7OeS7Jyko0Ha4HCEo94AQlxuISaZKLepiGrnjLyPVGMnPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S21TvpZc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S21TvpZc"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54838cd334cso3347857e87.1
        for <imx@lists.linux.dev>; Sat, 01 Mar 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740823441; x=1741428241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=;
        b=S21TvpZc+9ylR5+vOJJhVnXwg5Qkx+wEJnbDh9Q1o5h3hngIgNYvI8bbk2yV4AD/XJ
         k72wIVGXcXATiOkyVg4IHUEPK7O0S5cGosSd7aEo80a8bG4e+DcAJhCLLlWQ96pjd/6d
         77YC3thRT8wkOIV40g4GDmmIwRJXhKtue7sZr0RAoLcfi017CQzzDtE1YgdQhyoSgrwR
         6rNPoeZ29w4L6lXaW0cb390ybBA+eZ9/uIxzEPbCeUvGCZOsR7dOnYodFeYTxOUnyk3g
         3bQ6k65voGzEMFqxULfB02rU1vaEStsq0j/UNRiXHod9sm+5oE21U0qK12ivbf+R6ews
         ANhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740823441; x=1741428241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76ANipvR3P/jVIpgRlnkUUgAgrkLoL0o+K6EABpA1ek=;
        b=Cae1vKO+hdoZBsUxmWoowNIOwTsYfvSVM+ErNAVzV2tpnU5AOoJM5Xs18hawdd//6g
         pXwSBB5i1eAFlRR+ZqZgDai7RP9PeB4bVBxLRuhdDlHY8J2FquMZJywBtIvA51bjsCz0
         zFdr6oPkVhhd+ILXq1NGsuiPZfIzcYj9f45ZeFa3TEu2WmDKqInYla8jQgccI6/fTYyK
         aIDROCEffKmV5X9loGVsxHit+GeKmJqwBzHez/lW+CJ80FM6CK6YeL19Igo57hRNZpeF
         4HzoqT9TwDr6YuZRxbOIJ72/qExg3Hy9Go46P7Mnb4grw8dq+AtWsHMgLbVlH2kDAnJw
         QDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpU1PuojcvVtaw75IvFLqOi2H8OG1QwlHE8IPT/scJ7yf0GJWLbAJM24kti0bbKjUE/C4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1ByxlBYOHAir0jIT1atLxzjsKHDqJld1/tL3sXm2o7I9YR3GH
	xYPcGOmYYXfposjWN1rBkk9pqEjFPyNnOufAova0Rf2cscB4hOaywR9aKCwidF4=
X-Gm-Gg: ASbGnctoBX4hdTqYbWMx6L221CBcORtg1S5KFZ7mWuO3bz3JswijEjBrbte+jKc17Ge
	rM4/VHZgdfXaWbP19yKzpp8cYcdPrktFDVdvenFhbD528nArPf0xHjgAGD7KD86pPWnkfHx5XOv
	Oa6WUPrFWCuT3MvroETITdNxKbdHxn4DiL7gnP1A7aH24dxCSQZqEujCHVSAaKJ8iLwHgR9ebem
	NQZAUIrqBatW3jMduCM4AUa74C20+BobR922kG+/Xchj2UajYHNhSaUMzzCiMaWJJK1E5iUJ5bE
	tIJFZtE4pziHIHd3X+fQj9DvIMBPBDtpsIStl4z7QaifJ1VE4D8hntppEGHr/VXkF2r4pcz85Kq
	26FpaeWeupsBD
X-Google-Smtp-Source: AGHT+IFuYzubuDyf6X5ei2oE/n7MHEB/XJ+jimftn4XgARTj9v/mjL84XjfF68VTOLYEok0MXR5YaA==
X-Received: by 2002:a05:6512:3f1d:b0:545:aa5:d44a with SMTP id 2adb3069b0e04-5494c33304bmr2297080e87.42.1740823441381;
        Sat, 01 Mar 2025 02:04:01 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494f8bdde9sm463722e87.148.2025.03.01.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 02:04:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux@treblig.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Date: Sat,  1 Mar 2025 12:03:57 +0200
Message-ID: <174082343297.2941786.11452976094065423321.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 Dec 2024 02:27:45 +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This set removes a bunch of functions in ipu-v3 that
> have been unused for a long time (since 2012-2017).
> 
>   No changes to functions are made, just full deletions.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
      commit: 16e3bf497fb2d379f3d461fa0c85d14de0a3d183
[2/7] gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
      commit: a52ba18c254c0a3819e632e6371554f1c6f5bd16
[3/7] gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
      commit: 4f9c64e95c3510f4a5192bd401de5611c1dd5637
[4/7] gpu: ipu-v3: Remove unused ipu_image_convert_* functions
      commit: 96e9d754b35e87a5be2de7dce3c810ffdd769c84
[5/7] gpu: ipu-v3: Remove unused ipu_vdi_unsetup
      commit: 27985c86e283e1e5ac8a9809f189f03643a6f5f2
[6/7] gpu: ipu-v3: ipu-csi: Remove unused functions
      commit: c687c3147d5de801ed835b077802b68fe85d8a3d
[7/7] gpu: ipu-v3 ipu-cpmem: Remove unused functions
      commit: 2800028d5bdee8e9a3cda2fec782dadc32225d8d

Best regards,
-- 
With best wishes
Dmitry

