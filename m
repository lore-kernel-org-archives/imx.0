Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1B78F39
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427384; cv=none; b=EH57DKhOuu5gK7tw7QADctCcGpmxZcwRv6NAbK/Mmiafx+Qflitz7jSruRnuifUjUztWriPJTunNn+Za3A+0EbatZiWnGkkGYv+UXvN9SUsuRs7kZSEI0BvcEjTnvcb6lWth2J2w267/aohgDP3dPF90qeweFEiy0e/JpagbDeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427384; c=relaxed/simple;
	bh=59k6AAUQAcMyQRtWHtilwXm0Zvem5eHHNDBv4NZviqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXWSmx2X58DsFEHyXDhl+ir78u25eonx74MdoQ6zSX5CxVgX9lrxewhT5Zklue9yxa3xmRIOdke9alGRLZnZnIM+RYJpAhJTDill6Bv+HJ6bTG5NHOxjwlgB2fpV/HB7gg2LNZoY5iKrJJLlqEV/YI81iJUF5/xb5yyhXLJq7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nY1fZYOH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nY1fZYOH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436263e31abso5174388f8f.1
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 07:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771427382; x=1772032182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37iDQjIpWJV9G//cF72AU0D/7XMD1Sk3hL7SaalPYgs=;
        b=nY1fZYOHcg1fBbnA5uU41zUSmPFJFfNjDrwKdhMlzi/75u+3+QjAO5g+ZMRbuOCdSH
         cG6kM7amDoiUjFc3GD7zoNh0+y6yM8ulhxvmgsiWagIeUkguTHGh7B900dcIjhDdQdn1
         FVsyjpdP3XAYIFCufhNHLzTcVLHqWLuSalcPXpKfspZpNjPU/E+tff1kz1eQbgRJ2so5
         sxr7/s9P25Z6Z8u8mugP8V3ApIfQWsd4BI8X3QD3p31jKdHaD/USbkVk9H/Qh20s/u/Q
         Rwcab2MKBSpJ01QkPzPl6d6T64prWW24lL7F1FQ0m2Dcxour3MtBzTI/ziBHGjuqou12
         Exgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427382; x=1772032182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37iDQjIpWJV9G//cF72AU0D/7XMD1Sk3hL7SaalPYgs=;
        b=Qdu58u5elI9juzl+4GvYJHKBxV8+I0m8/mTXA+Ulmo+m125rcrcrDrPGrCC08CHWi3
         EXqvZyXFHiV9jnXQeMEnLnaDux0HVOLvilN4of0ohSlNuJ+H1VZ2j1C5MTZn9aSM6rYk
         h98mMK7q+2NrgT456rksSnZB+x7vEqqJz1+XmnxKUmXLbfVOygIu0jfe/q5uxepwQd9g
         N2M4vDQPrznUmUTjjgMlMulLDrWahrJdF3njegSE5lngfr1ivk0rpBjILKbW/3SdKTE3
         597NVnIEsFTNe6pDsI2DByrc3NxQPKnsOnvLXg0uwFFbrsu7aaj+y8xuLJ90HamAf80d
         21AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBMDSrjfiwFmhmV8JMKpFQCQTJPKYBSqdHaSLBs8l4anzpWZbIvfzgWSbgq+KHlBphD4A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx+d1lQ+tP1xrTt76tbw5MFzwl5w/2TENDiNIdIKtwQdYBODln
	wuTFqwT62Qkyw6kckfV1YMcZOqTkagr7URW4lfKO1fh1QmNlOpT7zFh4
X-Gm-Gg: AZuq6aJltOnpPLecwL7wVhNiVWYs7ZWb5vOJLgv4WYZfdsl9fBu3GCTcU2Jhmw3P/Vu
	WuyX5bArsuTYuxraTiLjtTE1gEg9lxGC1mZE1IknU+4uTOMWCrpo7aPeYDllO1b+apHVfhTi+uA
	//gZTkO+j+ZcZWIjNfLg695RZEBJD9Br3cQwMgW6SrlnnBHezzGVRTuUXQ4LwvacOB39JO9M7I1
	9eXWhpC8U+ulnv/4T0mciNMeYxBDcVHsLiRQqcvdd+QcltVxHVV8jIfw4sNSQVVWAfRHMbkUO9D
	uuRoqS+GrntWwa3358GvMgR/MJ4MPjYP6kSwlAUCNxYsVhTuK4TjS3TDJXKZwC5tAd1J5Jw2ae8
	7AsWh8rgqdJoIZeZUMzGOxRpSfWnT8TNgf1RhBtFJZSN0XdTo1c7tNFv/0HxP8wTcPRA4nbG65A
	yxb/Rwq7H7yGs7O+eClcm2Ri+3ppcUskDzN/lvz9bv+AS1EGtFzdsb4x2b27+K47x1IiLilaK+c
	rk+cjNC4farARHj/WTnRduVCbggpIbKsiOn
X-Received: by 2002:a05:6000:22c1:b0:436:18d3:25 with SMTP id ffacd0b85a97d-437978c99d8mr31041272f8f.10.1771427381872;
        Wed, 18 Feb 2026 07:09:41 -0800 (PST)
Received: from eichest-laptop.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm44333116f8f.26.2026.02.18.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:09:41 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: imx: fix i2c issues when reading messages
Date: Wed, 18 Feb 2026 16:08:48 +0100
Message-ID: <20260218150940.131354-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes two issues with the imx i2c driver when reading
messages. 

The first issue is that after a repeated start the bus is still busy. If
the driver polls for that bus busy bit, the driver will timeout and fail
to read.

The second issue is that after the last message the driver should not
immediately read the data from the data register or an additional clock
will be generated. This can cause devices that react to that clock to
misbehave which will also lead to a timeout.

Stefan Eichenberger (2):
  i2c: imx: fix i2c issue when reading multiple messages
  i2c: imx: ensure no clock is generated after last read

 drivers/i2c/busses/i2c-imx.c | 51 ++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

-- 
2.51.0

