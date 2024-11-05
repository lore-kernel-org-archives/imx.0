Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A91D2B3B
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802091; cv=none; b=b96jiTHLNlYLjCVpdSSF4BppnGFFxab078OgSMyxgSHh6rT3SY2T7VcxAkoNVUWzL0QeP3dQ2k6BdYzyPVqtwkfajoqLgt1WwDkw7u3CGW/O/HQ14+9o8wOpZPiO0IsFyVD/Tp73/9AwXdKL2Z+SfhLSzkzZZcyaqSYPPuDtexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802091; c=relaxed/simple;
	bh=e8qzjK8wn7V6pR2JgvorL3aV+z7+dV9RogYRqw8CPc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NXFyIWKoO0rYRYvl/bFZz+MZn3Dt6XxtBq3DN1x1J/NdysI3z8kYXVLmpFaG8gJbbQYq75LY3NmDwwSbq3A0TuAxFlOUgJti7KkliUMX3mahD2ukJcz7dvtgIZo0WkNuFm1ddcqiKbwilz6DMHcD9CvMXEAvwEENzRwbdGRoM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImM0sKSo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImM0sKSo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so46814905e9.0
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802088; x=1731406888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoTz69DqvACSD8CBEPwT4eOilZdTZnXMbIwAq3J92NA=;
        b=ImM0sKSogGgMSJvMhTHdCNiSrePThmjTzpCrZSRksTOYLWhcxS8AxDB27GkNFyS/J1
         W6AO6JwtNql5O/0uXFHkOQHbK8OvcnvZla++uYQl03a0v1sJIvY5MdgWCK2NsDTM5MPC
         /qqcEmXUxRwIAiDDvRFGoUsNMc9svuZO1o2UbcP/64w4TVVN64L5uEb7A9J1U0ZCb6Ss
         B7bMdMZHBNFw0Z3hL0grRCRMWhxOBC9l14XtpDcPvVE6KwJUT460tSst+a86EUjfStCy
         GeUo/NP1Lkwxr1ZF5E4Rpym7rTUWxbqeX7bJITSJAiD0gGrUCSv2aijf0KSjYq6nrPcl
         waNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802088; x=1731406888;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoTz69DqvACSD8CBEPwT4eOilZdTZnXMbIwAq3J92NA=;
        b=BsUyUKnbvfZWEXi1X74KD7sm08tOD4c8gx76CHPIo3Bn/Avum9W2wkbWNJGaQTA5AK
         a+RfyF2etjvIGDvS3JzE/uPXaD8YVL8uM841VZAz2ktcaNBAI0UILM0mRuHnvCA5XhMq
         bRw6kgXKeFY5dKtDp74authV4UJwT9KvLqQhV+p7+8ea/Z1ccK2V+C53DbfYqAvfTGMe
         6K+FkPXeC0ioIIFyhFCAW0L5mrcdjNo5HG9rPYqjxRx5T4DjFaD1nPLwpTRbWK/1S/WJ
         eAQs2y7dMCJi5iglLLZTjuo5/zTTrSrebJ/vKQDlfepg2h42SAlfgD9BZLYE71Thry4s
         I/5w==
X-Forwarded-Encrypted: i=1; AJvYcCWUDwHT/0PUMLnPG6OEZc1aTSR8muUVxr4AD/xCB5/BFR5LnplcKyc7VT7YvT3v6IFOAtA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlu6O2EItyuZAI8h3P9FI4ox+DmvUhcCLDoFVA3yvRXg4msbei
	TOe6Ptn9RdNtkXSqEL/w8wKeCqWYm2wfCax0oQiKj5QytukuNIfXx+msB4Ep9Kw=
X-Google-Smtp-Source: AGHT+IGhTzaLnUJnmHRZSzgGxrM3U4OgmFgwskj92OvzVj2AixI0DYQbDFQWRMdJI2wBSw4KAsMB4g==
X-Received: by 2002:a05:600c:46cf:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-4327b80c8bamr148149915e9.28.1730802088210;
        Tue, 05 Nov 2024 02:21:28 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9faesm212613885e9.35.2024.11.05.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:21:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com, 
 Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 yangyingliang@huawei.com, bobo.shaobowang@huawei.com
In-Reply-To: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
References: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
Subject: Re: [PATCH] clk: imx: imx8-acm: Fix return value check in
 clk_imx_acm_attach_pm_domains()
Message-Id: <173080208692.1891981.1146634464143827722.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:21:26 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Sat, 26 Oct 2024 19:24:52 +0800, Yang Yingliang wrote:
> If device_link_add() fails, it returns NULL pointer not ERR_PTR(),
> replace IS_ERR() with NULL pointer check, and return -EINVAL.
> 
> 

Applied, thanks!

[1/1] clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains()
      commit: 81a206d736c19139d3863b79e7174f9e98b45499

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

