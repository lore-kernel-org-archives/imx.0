Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87672D8393
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770262971; cv=none; b=HAD5ELNUpHnb3708z1seLRqxUxVUb/96zQeRD2lKDZ6GbO6jEJ8gBlAe+S9QGTOw8IX8SZ+GDCBQB7GyTszqcHzeTobX5jd1gwNjGFzVsRxAZOD8l4g9TuYdoIsm81v8YtamNg9Rx5vSp+pf9kadL8bm0ocqkymr8BQJltFh4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770262971; c=relaxed/simple;
	bh=yTIiCoPaf2axh3yw/BOxlWdHS8hPHmnROAwOuIuJHy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YSxkOF4KPhrRgd9k49cw3h8RKDxJD4RFMmO7DVDhaxFWIKsWQzb7G2EA8fHeB1lht31KVFoyDsJNgUYCJqSaG9XRViB0SRA3JIssv/aZv44g+B25eQKdo6wdC7dMmESmzI3FEF9xb/1SGiKTuaiSnhi8aL6Kq9iLfAmGtvgp6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=kv8gukxP; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kv8gukxP"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7cfca52ac2dso340052a34.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 19:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770262969; x=1770867769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8odmZP3AsmwWLVEEIesC2LXuxYRFDXqGBxQCRutSXw=;
        b=kv8gukxPeOcyx6hVtFTPl5rnRn/1t6NnsSgt5jOHtFqOUI5TJjf+MzM5lyrnPkW5UQ
         DdzAly3WR3xwuTixTw8x2hqld6Xw829QB6Zl1t5d1NfQ2LcCGZQ0ipKVtldmBpVDM8tY
         WbPtx5sxjLr0IZFwwvRkBMPaLvMDduzLt6LXQq2SUi7OqV6s+eWjy2mnt8SrQEfD5ren
         qUw59jqT6eZM5cmU11N+XPwfSGJ3XlAdemVgDT14RAQMPRkYUd+cn3Kb2qJ7lJsQgBXK
         DKjTHyCI8wPU3A36DGPmveV1NUb+oQbqjZI7ikBxrvs7jK38CYK0/JpR0BZgvgWXQhIa
         duNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770262969; x=1770867769;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8odmZP3AsmwWLVEEIesC2LXuxYRFDXqGBxQCRutSXw=;
        b=NtGGkSZKiJase4zIGCBFBNlXjWDAApEFJk2PzF45FfaLzpwHzaV8yUqnYSbussejR+
         OXUZFq8IFihv8eNO+/yGfrK1nxwAWfZ5Thu2Ts7Zq5q1f3rTmEDVl9izuwiWreM6bakP
         CcbCvmh8yIJ6sxBJdMds3zsvpVufM7VzjdeNX/7i5l497bOY0AIBftwh3WI9IJTq66tR
         06f+PP+0PkyLk9swKzrbssckmNznIsFdW5q3sBgpJzvZ8wLCHk/mXzXJ+g4cU7oXnzjN
         +sJzvzGV4ial3PU9dvZJ8RIH1ti68e1s7dnFIAY8yfcDlZ8ZBL3HAGyOpuNpy/tmyyTP
         HQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNligXjRJ2j4pHBEegtKCH5c0WgiaJ8QPN8w4FYIiXLxVjbfllNrtSY3ibHnQHADGqnQw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMy4Y8mM3EQe4THXNDqQYZSPUDXrZD4fTvQ3hCIOPKZ52QKMD5
	k/plJT1fla2Ol9zv4Kw2HKgbGhPX8TdpmknELrcWJU3rKScXkwbDFImTjAEUqaBW5x4=
X-Gm-Gg: AZuq6aKvgtulZ/vqw+67RALFdlxJ1qsk4IVkzY7Pvuo7PlczdLDIEGdzlrR41vCwUPF
	V/LtQTPu/gSxM2ytDUJ0zH3jz4xTYgA2qHUSzNO/peq4FJyvMQmNasNIbQucSyJIireUNnsD4RE
	ZJ2+FutoJFDsX9Ep6cZdbVl33aDguKx77e9rGna5kkNr00EhYu+Ax54RtABYbW4gGycML706lYb
	fgsZ2ArdWKj/k4JFsvxO9nYY383wADt4hY/OHH3u4LtgFrmubFtVPMhm8A3vFUBerbba2owmG1u
	x3hw24Jq/zbtvkWLKr72HeuQ8q53GPtC24OoJ2j/wul9beuBVVsLIe9VZx5h4KuY/XqOR32p3H/
	gDIXbr57bAeraywswOytZxyApQQHzmz/nufvpUjJpTE6b//tK1/rNcqWN6afATvbXOYx8vpJIIM
	jLatrcSzs9h36mJ58ObJGaNzo7ZoSbU2icLuMn+ScGiGCbDDUpzJsWARlGOuH/WzuzU2hmYlk2T
	bI=
X-Received: by 2002:a05:6830:3901:b0:7d1:4d71:95c7 with SMTP id 46e09a7af769-7d448abb460mr3043741a34.26.1770262969619;
        Wed, 04 Feb 2026 19:42:49 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4490f35b7sm2812181a34.1.2026.02.04.19.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 19:42:49 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: ulf.hansson@linaro.org, hch@infradead.org, ziniu.wang_1@nxp.com
Cc: linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260204034003.2961402-1-ziniu.wang_1@nxp.com>
References: <20260204034003.2961402-1-ziniu.wang_1@nxp.com>
Subject: Re: (subset) [PATCH v4 0/2] Optimize secure erase performance for
 certain Kingston eMMC devices
Message-Id: <177026296860.37701.668895586539274878.b4-ty@kernel.dk>
Date: Wed, 04 Feb 2026 20:42:48 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 04 Feb 2026 11:40:01 +0800, ziniu.wang_1@nxp.com wrote:
> This patch series optimize secure erase performance for certain Kingston
> eMMC devices (IY2964 and IB2932) that take a fixed ~2 seconds per secure
> erase operation regardless of size.
> 
> Currently, a 1GB secure erase requires ~300 operations (limited by max
> discard size), taking ~10 minutes. With these changes, the same secure
> erase completes in a single operation, reducing time to just 2 seconds.
> 
> [...]

Applied, thanks!

[1/2] block: decouple secure erase size limit from discard size limit
      commit: ee81212f74a57c5d2b56cf504f40d528dac6faaf

Best regards,
-- 
Jens Axboe



