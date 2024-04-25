Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A98149DFA
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057417; cv=none; b=J7BLKS9Ep4FrcMjtChiZ5Mxnp6nQtE5S/cmGEKlRXVDudSTc48YriuHXTOuzzQWXxcPSL3LJ5cVH2Xsta39SsnLqZA2fexrZR1Qa7W6+yu6Bo1VEZ1nxWn88VSmQo4Z3v7GDROvLY4ALcbJrq8uV7jrYN9loFblkQUsEDAly+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057417; c=relaxed/simple;
	bh=6HVultyKajYKe1H+uYe3q2OjaTtG4U901xdI1ul0mzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WQkm+3VjqkgYvM7dg3qysFZqPk3oBTg1hMuNgEsfEfcsEHt1RfcOUIabng701M0c4TbT73Mizu7lUa4GwE6OgS5y6GMAizIAEXviAqY4NPHNJ6jF1xxd5S04Zrtyg+0+yoRsRZ3K1EJ6vc/0IsDeBEGWKhCIoy5L8ML/sn5haog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oJiShwNT; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oJiShwNT"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-22efc6b8dc5so722552fac.0
        for <imx@lists.linux.dev>; Thu, 25 Apr 2024 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714057414; x=1714662214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVzvIdSysiCQUUen73Bj+sLcl+k2nyJjAr6PCZt7XT4=;
        b=oJiShwNTyeDZeZCVf9trQH66WMND5CE4pX6wKoHKP8/9G5T781jqMobaTjgsd7jkFd
         W2cpf6pelL1zuxS1+NiE72hiJ+qRn79N/SNOAmmvZjfIEfOFmWfkCYFT6Vqn11PhVkDe
         Zd7KZ/LzXISa4nzuM8z4j4B32ybz4++//r8WBoqQL9dp8ncBNAYmc/+DTYERXw8WCFsO
         oZR8RtEHzo56Z+R93u5twYVcA8Qr34jyYv4U2JAqqGiqYr+2ul7HRhkVvgPYggN3+XdK
         IkHY0KlXBtMhfsDxVHMEuBbkg6Xn2G8Fqk3iZpx/lRuRMKWb9Oxv80hjp77uAsse3Cbw
         mdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057414; x=1714662214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVzvIdSysiCQUUen73Bj+sLcl+k2nyJjAr6PCZt7XT4=;
        b=bcfnGNLVEXvjCF7rTIfe8eegCXPvTIZyjPhH1L7UdGfVgHmoEa+u79ie3pyhGgnWpf
         cYpEhL4EIsGFRuuxeFvp1Ep+eTIDVppkpVkulW9xjX8knhKFWWJoxQWtACBx9dVKTy6t
         nsGMEAC69QlgN3bXCQBBSeLUo730XzJcbzsrlR88j7CXeuRFh1IM/gt3Pa5Bem8st659
         diczcK3pBewgfvSz6Eqzakq3wzoXsFk/KbTDi48UUM7Vls5sziDdIZCx7/tn7w3QlBiq
         FsIhG4ydRA0tWvEeAYmGJujyH4BWqAlN7IMnnTH80vShABWNQ8SNttxBLbDw1N5KY/H1
         jKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxV8tzmQYdPM+r+JlQTwyIQHP1K9LpXDVdxp136ex+oakuqWKjZEch4rEbkp26V76jBhVD9XvaZ6q7rKNxB7HrVzNT
X-Gm-Message-State: AOJu0YzRWjbPg5uaARGEtcX7uMDanMo079tqXuHiziSJbO/9k/g+n3IB
	eZ5QYDQpaMZNlPwN56l+wJete7S2M56ng/58Eh9bz+fTRXvBMTxSK06JqaPMUZU=
X-Google-Smtp-Source: AGHT+IE7uk/e9lPnEmRVtei7ZdUwH47uHhQ5kFtFyZHHsMq0kRAPIHbtnVqwEvJRA8mUQD2RSmGSfw==
X-Received: by 2002:a05:6871:4393:b0:233:276e:6bbf with SMTP id lv19-20020a056871439300b00233276e6bbfmr6917951oab.15.1714057413979;
        Thu, 25 Apr 2024 08:03:33 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mp2-20020a056871328200b0023b6d4723edsm166739oac.14.2024.04.25.08.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:03:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] iio: cleanup masklength usage
Date: Thu, 25 Apr 2024 10:03:26 -0500
Message-ID: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

While working on other patches I noticed that a few drivers are setting
the masklength field of struct iio_dev even though it is marked as
[INTERN]. It looks like maybe this was not always the case, but we can
safely clean it up now without breaking anything.

---
David Lechner (3):
      iio: adc: ad7266: don't set masklength
      iio: adc: mxs-lradc-adc: don't set masklength
      iio: buffer: initialize masklength accumulator to 0

 drivers/iio/adc/ad7266.c          | 1 -
 drivers/iio/adc/mxs-lradc-adc.c   | 1 -
 drivers/iio/industrialio-buffer.c | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: b80ad8e3cd2712b78b98804d1f59199680d8ed91
change-id: 20240425-b4-iio-masklength-cleanup-86b632b19901

