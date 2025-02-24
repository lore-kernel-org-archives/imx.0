Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A52571CC
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740426627; cv=none; b=EzUZ/NfzvAx3MGnxrUCIlSwicw9OGpzmG7//R1LGp4P+IQwgYvFohmW9NHEeQD5LPD+QDcazEvJygML3OT3k2srDxak8tgMgPQhu2SA9kokMG/9cdWTqGI/ctAMFCMwcQgl5T971FaIK6+UCKDTFnT3Xu9QXH0NGK1EiaeBiYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740426627; c=relaxed/simple;
	bh=Edth2VWVcL+GjsEVcws8isbYUTtJY3BgQThXqgK4CI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpoPysnccmqKnbJohLHD0SGyZ614yMa8H5Q2i4otoTjAyukBzbdVcDCPj5B7xRte5HAbHCRnXkIecyF3uhucTChc5gdKDVYK96hYXlgnkJ9iO2ZJtwZehwqquMpf/sAi6QgqO0ehwMH2VBU8dJLM1oobvhhTppMgZkldlMGRDdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T5lrDe83; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T5lrDe83"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f22fe889aso4301946f8f.3
        for <imx@lists.linux.dev>; Mon, 24 Feb 2025 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740426624; x=1741031424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9+hwLdkesHaCpLTwGTfreJKZNomNLyAPfa//tZH28c=;
        b=T5lrDe83Ni0nj36a7CYHr/5xQXPThELvuhSZgY5iPGzQQJ3eU+Yb3JGSs+xgdNhPkK
         ZaksUoNDo5qemIlip1J6rnoMnoN2RmTn7Vnp/Qpi+xE4GyFrgGFdrrlSiLF20dzzoYqt
         ddYUgXhQjklTcW2fA4OB/p8rtlCU9jsg7e4QGk1VDK3w+iLkJcmtQOLp2KGyUoPCqXCc
         R3VkyobA/53Agspl4EuMt1HRVJis+KcxEJ40COkjPTQhOKAlujD0nt0Cn5HQhwcJpoy3
         Mngy/gPD/5tdhBH1YS++0D85W1hpnSmWsG6m4vk/7oEV1nyef5AhntR9Wg2MnyJ+gcZj
         QAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740426624; x=1741031424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9+hwLdkesHaCpLTwGTfreJKZNomNLyAPfa//tZH28c=;
        b=nWRUK43pFitQyi5kjwMKpp450S12yY0D8WFLLwIWQGoaeyrEHReQTJK4ZJMDzbiJng
         XyN4UZWB0f5BW9BvmDn5M4p/dbse0i3/GqiWullO5hdT7MyXhGNBYm3J36GS9ymPIrx8
         ysNtB4L3v8gHEGn/A9MqlRnQgwqmLUob3TWAmjt3pECO5kzUamuXvkJkwJsDydVmMCJ3
         Fb3t3T3vCSxVERZDjoRe3D0JVqrWY2oWfX3wMJDZoZBPArWiH6jToy8IdUGCV0rGxiLc
         xGMfe/TOb/C+SuQi1H0syd6sDrc9QhPBNbxxYBh3v30oZZCrdludY0jsTGHjISu4ziI5
         yNeA==
X-Forwarded-Encrypted: i=1; AJvYcCXNI5GOdBy57DlLCFM6JXcDqmadJ1KjhmE+rbONhT+egPB8jzT9fQ81ZIQzS3NceRTWgcU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQAStXHIrniHsjd7HO/2sx3R6S+gjPE389kkUUygC4QRR/tva
	YtTxoGAF64EmS0VHa9mhoEgwSC10EIwRWOKK9ObEs2titT3R3VPZjDuUvKsFtWY=
X-Gm-Gg: ASbGncsEHzQRZtk+KkmxZZ8TGpSIkv+84bgzbKZz/vM/Ch1oU1Ic1b17dhySQaIgEjV
	zQP9Y6EiQXV86jSUXga/2p0TOQDBmfvnDX7H9avn00Fq7E7D3ysP5Hpz9gQgecsRssbg7xsCJYI
	dNMytpGyaWyC22OEV5Ovqr3hKpqJD+LelSkqcIYuViamhitjmJk8m9MmqV2W/aRhtUGOEOiRLGa
	ZiwcXnVrE/YjlRAlsD0gqvKih3KTMnJ9Jl3wjNBOyj/lFmNvpjGhOX7zgrN2FtMWs/p+5M3i51G
	Z4oKOHOtNSJ4TWTZp6dl20Df
X-Google-Smtp-Source: AGHT+IFyM3bVwnZAodvVkV3LiEo56tzMFahJhbq1Psx/DtYCXKVCQ4Dxpkxfi/9ZT236MmccVMOpNQ==
X-Received: by 2002:a05:6000:1373:b0:38f:43c8:f766 with SMTP id ffacd0b85a97d-390cc60bb96mr371279f8f.31.1740426623515;
        Mon, 24 Feb 2025 11:50:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:eb70:990:c1af:664a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab153dba2sm1315295e9.16.2025.02.24.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:50:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Johan Korsnes <johan.korsnes@remarkable.no>,
	Bough Chen <haibo.chen@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	imx@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Mon, 24 Feb 2025 20:50:21 +0100
Message-ID: <174042660990.65481.17407135211920816325.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 19 Feb 2025 22:04:32 +0100, Linus Walleij wrote:
> If we're using gpio-mmio with a pinctrl backend the
> direction callbacks need to finalize their work by
> calling into the pin control back-end.
> 
> As I was made aware that the vf610 driver was missing
> only that to use gpio-mmio instead of custom code,
> I took a stab at it.
> 
> [...]

Applied, thanks!

[1/2] gpio: mmio: Add flag for calling pinctrl back-end
      commit: 2145ba374069ee8edc9d29c2a6b56fe4a28a6e2d
[2/2] gpio: vf610: Switch to gpio-mmio
      commit: da5dd31efd2465ccc9a70a85bdc325e394256689

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
