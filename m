Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E222A4F4
	for <imx@lists.linux.dev>; Sat, 31 May 2025 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674665; cv=none; b=rUEAjy33dzU4Csw5563QHQyKFihusWat4suJPXD18bM4xZHSBS0zMeEXh2QN9oX0Mx/jyMjfn6E19hvdkxs/SkFElktXS+USSlHJ6k9H7+Jox1IY5Khh48Aqj2iTkDfZej6lXjoRH3/BEcSJQ/Ji+DAmBj9wS3/b3+Dtc1mxypo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674665; c=relaxed/simple;
	bh=7XrLppQO5qB5g9WEeeWY3UVbzJBtnah+myNv+a9FfF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gwRxijKtxUPGQggTferRW5VYW+ZY/qwnbE5NtjhrGBkKsAV1hQA5994uTPdWdEcPW9TQqe55iksg+Sk4aomNtTi+jQ0D52ut2YrE5gwUGmWtYkjts23eu1qD3KN47QeR2ZluPL7T5itlF1h4W1/16c1nL/y+8/p6nqvdcqjiJMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfvafxOe; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfvafxOe"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-23508d30142so29112215ad.0
        for <imx@lists.linux.dev>; Fri, 30 May 2025 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674662; x=1749279462; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=;
        b=CfvafxOewvQrJV1fQe0f1B7FFxu2SPobXfBuY7YxhKaunjx+joWK30ohj8CC6j62kw
         uNpY7Jls/UvFcb/42Di/o1hQt90EiKgur5ofa8h4BzTFtLveSPmP/5KUuXx4160trRwX
         tRzEB2wMbm0PedvoCztFZl8RoFxveAtgPrKloMpZpOnixge5Xd6jeBmY1x8jXiqubLyh
         U7MP3QvWYqziEoA4UCpCxgALFL4ehQfo79S5ecs01b9PfQqPVakx/LZZnPEMg60HlOZL
         azWUVnZwuYCVqRmG/2jB0FzJG/uE77z2TXbAsLg0I4SDmlpoh7UrDfLAafJNzVqThkhy
         fzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674662; x=1749279462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qcHiI82/LFv1dYpB1HoVb5XMF47rsmDr7PMAQ9iF1c=;
        b=WEl5AhNRunzkjKsLAk1E81eu6isqiuFMSkWXmrAZgh46ruw/IAOW8Gi9107OxQ2pZY
         0/YhFqmNqTtruFqYe0c/iUj2kOUiGWC6Oo57BQXqwelm4UwTLONd3ry3DiSh14svlOuk
         wxUrn+2MqFqXUcExAA1Z4i2D8vubQJEw0VdPC6PB1PbfNyGAsnCQbD2dSboZnaQ7pO5X
         Es+n0DzsZE3i8QO/1W+nU2rzmxiaZDjypZ0Z0UO5ihBu3UmJMz/Yp3Y6CUGO4zWumsC0
         hKaYGeelSflRUb5B2sE+ttfjHMv+i3pfzkf3z9N33+GDTlL5oRtpmvb3Sb+bHMnYtNcc
         ITeg==
X-Forwarded-Encrypted: i=1; AJvYcCXud3ps/grSUHqRvxByiOsAbXTIyGTYUzWftXjbqTPgHGq1yeSECXw89bXd7ndwPSLWnNQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRM8OkMtocPE89036ajbhiPUsCjD8BhV4yJw41R6kVrxMj3XW/
	iF9Ky1eIGf1rUxvAchSiFGH1El95ugj54uBnubrwJR+pjlEx8seUffcS
X-Gm-Gg: ASbGnctwi8Rzrp09auudiAQbmCO444HjzByH9sjMarH3m1bpYjI98RC+nDlHkO8QJVp
	IprE3gDXGmsoTQq3WVfECVuZJ0oElLnRxZ/BrBpojZk4g+mmMcinQhXAq8abjxJCQYoHSoLs19T
	sLsgQ7X3YKqc33/HGZRYZr/0uz3jYtjlZMSWB/KTo4JL/jAVv6Sm+9cLZggdi5kUVxYcU3kdxIt
	QTnlBgMMFAQA05l9ltpRaV5WncrYS2sBHicI/dvkQHtF97dPkRRhBaHCK2aDhH+VuoKZIAa2dJ9
	LigQSh4RG8krX7xB+a1XEpkaWSJHzaFlSIc=
X-Google-Smtp-Source: AGHT+IGGhT3HnZACqSoO0BWBt2NHArRjjRnsN6QNso3lrv38ZJCqSmd60+cj2QxJNX1QE7jAAytsCQ==
X-Received: by 2002:a17:903:b4e:b0:235:1ae7:a99c with SMTP id d9443c01a7336-235395b2408mr63803315ad.32.1748674662034;
        Fri, 30 May 2025 23:57:42 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:41 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v4 0/2] i2c: imx: guard and drop prefix
Date: Sat, 31 May 2025 14:57:25 +0800
Message-Id: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWoOmgC/3XMyw6CMBCF4VchXVvDdChFV76HcQF0gEnkkoIEQ
 3h3CxuJxOU5yffPoifH1ItrMAtHI/fcNn5Ep0DkVdqUJNn6LVSodBgpkKxyyfUkX51NB5IWwMa
 xtYmhRHjUOSp42oL3h98V90Pr3lt/hPX9mxpBhhIATQEFarT6VtYpP895W4s1Nao9NweuPLcIi
 vASZdrgL8cv14AHjp4nYDITqTiNDe35siwf+D109CoBAAA=
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Carlos Song <carlos.song@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=1377;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=7XrLppQO5qB5g9WEeeWY3UVbzJBtnah+myNv+a9FfF4=;
 b=yNqJnBELWXIrnWc0OTDAapEeh0k2sIvvzRqEwsOj6o/ZZMXsWmRcGtIy1Okf8MET6yz0doUaX
 iHpUyHvR+vFAe3WpHJ7EZbP1jUaz9rAUzUkR6viFFygw06souqRcV2j
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v4:
- Add Reviewed-by: Carlos Song and Acked-by: Oleksij Rempel
- No code changes
- Link to v3: https://lore.kernel.org/r/20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com

Changes in v3:
- use scoped_guard
- Link to v2: https://lore.kernel.org/r/20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com

Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>

