Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26138DD9
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 23:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712618004; cv=none; b=T04ZDV4FhlLH2Yd4pMvDzHk9sScfNyHfdb1ZbLpMYv31BhPrrv7U/cX5uvUK8LmY4zjVA0a3dVY6WjYGTOzINwzjS916H8fQwgVoVkpE+j0Fg0YmGOddltFxF+6fTs45lkPAyPa4Tt+6VQtqpPvZC0329DIeOPwW7d/ZbnqI5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712618004; c=relaxed/simple;
	bh=x9mwVZCtRJZxj4SxW0pxGiYFzzdRxitCW4paJ8e6Vwk=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=pVIouQUHZiykyk/2t5VMb6HEdQcwgmf8ussvdTX4Fqym8RYwvn+ZaXCgz8YaxQ9rcJgxzxcN2oL8WpmpQQB8B1Y0CCTQJ0PDXl566VSM8ohaIkkYwwAvi+O1V/hfy2MGSpEcutw2CYHwQ8AUqmtFwvRisvQdtS45ojYI8D3VIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kl/Qpv6I; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kl/Qpv6I"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-610c23abd1fso92899137b3.0
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 16:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712618001; x=1713222801; darn=lists.linux.dev;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8KR9ZDVpmFlaIwvKuBx+EnAZl+aysJrEDZLL4TycsvM=;
        b=Kl/Qpv6I2ZyK8W+DktOVPlDG9KwqJ++hL2PZsrGtBuxk4LSJb5p9SqGb3It8WpdgbG
         dE5ke3DngxjHlkVsr+Gq8AkSDQoCVOIJsUnng0Etw4Dp4aoKuZxAC7dIboN8fFnx4l1i
         YE03PDXhMYyXln2oROhG0g8g2pVBqFaIa+DpCAp9Kfj6zwIrR1k/tzLibt4dMKrUFYc4
         JVf54Xd1+u1FkLdU1B5q5//WZVxkzxGrdUOxnfKkNmfarabxJq/5ClFAalaLMjUyUUP0
         WZzZAFN6b0UJC/TZacjQHWnkTQ9MuOGjyrMn/thV8jQvUn+XiGs3HNZjsdY54paavVuO
         ZHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712618001; x=1713222801;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KR9ZDVpmFlaIwvKuBx+EnAZl+aysJrEDZLL4TycsvM=;
        b=newngH35BQ5dPfVfW7lD+ieRzW1RW8DH7kvbsRalqj0L4T+vT/7pi4Y9ixo5HW2RSP
         R9TPcQL0nWP8Gg2bDrdD1OnNpzuKY49OZn+ytX9a4jS6ZeTzbrgF4VhxG2JjpZ58zMbB
         HCP/DL8fV750zemDYg3kAGbgJKxiUxqq2twYE6gb59Q+8OrL/xq4CUXyPqaffusZBHoo
         LDDXQeH6xTZrTvgm7iVfATF87zUhwA/TisNMjveTxqaXeNTgHOYJfnG3Ti/Rg7ZDLwLv
         VDqZkI0C4VLfMbY757izSM0oyOZt5uvOwY02qxzajuKCLNmp/2ttHEzcdAGAAnaJvPgM
         EYoA==
X-Forwarded-Encrypted: i=1; AJvYcCXknN935i6SHyU6CAA3cO8+1rpSKNR3fzhkI0a6YbrW2nWmCzKW7aqTI8VdFtR79KbfodOGQEiQdhDgPMe2A54Zph+D
X-Gm-Message-State: AOJu0YzRk7vpdvHJskA6W5GGpMZB0MwinikiEOEFilJwMq/5KXqI2jBr
	MhzI7/KoRkevVKe/tgoPGz1D/31oExhowRHEXmId1HePhMYBN3ocL3m4MD+F3r06egQuDLrLFL0
	OO/ZaH9xCMNDEtQ==
X-Google-Smtp-Source: AGHT+IEiBKuFp9QTgBmavvNyeuDLhVieZKacyXA60iTXYXv5owwSC1k0jFYE2SUKHElIfDGTrdBpXZCX+VZqUfk=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a81:73d6:0:b0:614:2c5c:d275 with SMTP id
 o205-20020a8173d6000000b006142c5cd275mr2854389ywc.4.1712618000795; Mon, 08
 Apr 2024 16:13:20 -0700 (PDT)
Date: Mon,  8 Apr 2024 16:13:07 -0700
Message-Id: <20240408231310.325451-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v1 0/2] fw_devlink overlay fix
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Don't bother review this patch. It needs to be refactored better once I
know it works.

Geert and Herve,

This patch serious should hopefully fix both of your use cases. Can you
please check to make sure the device links created to/from the overlay
devices are to/from the right ones?

I've only compile tested it. If I made some obvious mistake, feel free
to fix it and give it a shot.

Cc: Rob Herring <robh@kernel.org>

Thanks,
Saravana

Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix probing of overlay devices

 drivers/base/core.c       | 10 ++++++++++
 drivers/bus/imx-weim.c    |  6 ------
 drivers/i2c/i2c-core-of.c |  5 -----
 drivers/of/dynamic.c      |  9 ++++++++-
 drivers/of/platform.c     |  5 -----
 drivers/spi/spi.c         |  5 -----
 include/linux/fwnode.h    |  2 ++
 7 files changed, 20 insertions(+), 22 deletions(-)

-- 
2.44.0.478.gd926399ef9-goog

