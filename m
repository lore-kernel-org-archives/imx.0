Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E71849F4
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021087; cv=none; b=fxybsxeBS/ejg3HrAcFTM2Q3XCP5YnFVgE9Oi1Gjz4lrAFa02AehhDNZMvHJCQ3ExQZVJmFqOkmnoXfk57odjObg4hrxWlWtVkfNoYCBksxDu83JdGfDeLyw4v767B8mTdZ9NMIgMHPMzcUyr6AZ9dKC6VEd7zAc3cgrGuxgKIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021087; c=relaxed/simple;
	bh=lzMbCVVkUhr/GXktAPjXHVvLMvpZ3CXOHHuPfAw0sE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OY0l/b5lc0SYkuD6Mv0w5cQHHCAfPY7gj5cLXi+V5olJMru4AabRAcnWfFa3hHQTsTwzDxGT4J8aUSS6YkYn2dDCYmt2pXrtbHn+OO9TGDzWq/9pXt0x8ElQYAjSd9I1K2BlOfdYhNJu4IlPcALbjK9xeVn+taU8md/jUxTVObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJyqqhPn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJyqqhPn"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso5707703e87.0
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021084; x=1720625884; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdS9SKvs4g+g+UgHFzYU/wnbS48493rr3qaG9jHxGUY=;
        b=aJyqqhPncC/HlWUyQn4SNTrQuReTNNcQQmg7xaIAOElVtUalnz0pS4pbz60wbAI+qq
         SmJhPH2UDm4GpJBE1t7dK7BhiXlR2mUS1KvJKYg28JQT3TYqh4/PNSXwhSx2dwVEQo3v
         OrwkL7gUCnE4hEzvy1vpbi4id/pBFM0tsFLVl+PRJUHWmD7qRx43Ui4Lvlj1Reo4S8m8
         weDM/uAMsvhJK9rGRKgJg+egWBfufmnYRr8HjG65LAqExsgI56FGSCx/1H6NltZIWNIG
         jOMYkz/vhbwRZQRLBR+BaRvU+Q+K54878HOsSmtbjbl1nsb4Rsd16Ks4OoyNstCuXoET
         iUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021084; x=1720625884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdS9SKvs4g+g+UgHFzYU/wnbS48493rr3qaG9jHxGUY=;
        b=TXCYmvS/xlKMS6FXYytll27HhXHnGBVYTiXtdzWqWoxbbQzire0Yh0F8CuPaSbmDEz
         pARBtrnIQKzPK18e/5A8Ujd8NnN6BrXe66Iq00nIarQ9eMURXkGSHA33VkG9jE7ldN2h
         7znE7krC8TYSp2kIw0d1pYMT8RhBqyaOYnhtYaJBynqn6rm3ZtsCi0I8XbqJW8kcVto3
         tJGhIC+qKss34wn7yJnwHuSXe12aypg75FT8CAOLZq0hsjN8payb2QrZvCdYCEOG9Mip
         8e9TZ68BLyR/HXn/0CTmg3iNRRyy3uoybXf+p3MHf5MOdAY5WFyeuGs4crX66wYj/QBy
         aeNA==
X-Forwarded-Encrypted: i=1; AJvYcCVsqhILChrcCcdfhnxcjFDs574MK45PJh0HfoKPmJ8itK9+X2OsCgdT6gAhLApexFfj7kQ6WF4sM8HWVE4D9JDL9NHw
X-Gm-Message-State: AOJu0YzjcfkgXoGXTf4W/naJgY8vzKqPXOtZZ1E4tinty+HIzQhPqyD+
	aXuDKCnYhfxesvvMPEy0QlyTmYSj+YT7fMfGZPM6OB8nknMxYsvv
X-Google-Smtp-Source: AGHT+IHwFB8TQNcdHjQ/YqR7SMzzhHpQv3iUJdREXWimGcVns7AHZAlxXifUlseUShDfFdJnperbfw==
X-Received: by 2002:a05:6512:2087:b0:52e:9765:84e8 with SMTP id 2adb3069b0e04-52e976585c6mr1154203e87.66.1720021083425;
        Wed, 03 Jul 2024 08:38:03 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:38:03 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:39 +0200
Subject: [PATCH 6/7] mfd: rohm-bd9576: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-6-aa6cd00a03bd@gmail.com>
References: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
In-Reply-To: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=759;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=lzMbCVVkUhr/GXktAPjXHVvLMvpZ3CXOHHuPfAw0sE0=;
 b=x2zs6xZ3C6Z3pox8EuivN4ERbo8dgh25Q6A9PVuS7nMxK4SfhF8sFveHVq4LRvLRHpmHQP5BS
 zAbnL8XwmmiCEcxswwcRZbh5GQgnBScnkI79CjELCnPg+Vx4TFsK64t
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd957x_regmap` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd9576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
index 3a9f61961721..634c65c7d108 100644
--- a/drivers/mfd/rohm-bd9576.c
+++ b/drivers/mfd/rohm-bd9576.c
@@ -57,7 +57,7 @@ static const struct regmap_access_table volatile_regs = {
 	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
 };
 
-static struct regmap_config bd957x_regmap = {
+static const struct regmap_config bd957x_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.volatile_table = &volatile_regs,

-- 
2.40.1

