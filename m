Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74B60260
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712641034; cv=none; b=NShLDswghPmPC+C6YY56uCXscGMs1asyjbARZygA3tI1cCE9yGXJQ2slWX/XqfCYgyZfjSQN0JW5Ox54W93ajgZjqIHwZfLlc3sFpfrPjV9nGP+f4zEIXI3iNMuUSxCZSC024qCPXkkDk1rb4Dw/oLDcv4rtKrU2PTpc52dcNu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712641034; c=relaxed/simple;
	bh=3Orb3QTXRaXb11VTVjJfinDvuFxce8w6tXhNzD+FbhU=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=eQyIrGCjn/4Q4M+y8R/LGPIZ3JsTxiWMjEZYV/glnKkTgSiCe65X9wkAya0o2g6AUn95lpXzjuQYI2Waxv4OzEXlGEZ6NiABkcbQHMCYDS0GM/sPr22qOAgCyoxgpynwtfdeV4ffP1Q5ZHFo7fnTR++hx9B0UG/xKeLaWyWEsn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3VxjjLK; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3VxjjLK"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so6411500276.3
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712641031; x=1713245831; darn=lists.linux.dev;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hOqyoqJhFYBkPD/fv6EEJ8QaMaUrKnwkxLRauGRufLU=;
        b=R3VxjjLKBRiIk6N50Nhc9RxXK/EJG4pXE9ZWd1bU7IigO+MdURDuabql7DdAG2q8uq
         LYRpxyxbA3xqX98MuVBGr0HAxSz5rGbNm7SVwwXM8Vz6NTG4NJWafji5dDruiLY46nwT
         q02HBQrtRDNSt9jXYlryS+JWOOVGRhZ7yj7JkNhYcPb9x1W0IQ7FEF+ZFroU5mMRorIf
         AhZrhb11NeuuwuRrmN1Lb/e/S6GWi4Or3Fh0seWJbdvB9bhvL7jZDCZDwSFtm2R83zSP
         5M9d5AMZUIG6DtDGC6/AshY6BiK5+sQAqILJ8xQifs4C98cF0UIbOTAwSebd8vaREqsO
         dWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712641031; x=1713245831;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOqyoqJhFYBkPD/fv6EEJ8QaMaUrKnwkxLRauGRufLU=;
        b=uKBwmwSks/vZnzhOKHzAa6k/2vbpg9g+ZAVcZPIr4wSAznNpiUabd3RCxVEnVebRv+
         TlCLD8pGGWZw8AWrEKQrUj9cfjBvBuhlRkHf9hVup3GRfx1pgbKqVI3PPBOwZAs8YFyc
         o3Nkw0Q8Rfsw+maeVTHjBChEJzJtwQgDzdmgKEZrJf/GreZSVZh1FzWtk9DigS4j1sCS
         J4+GKDcuDqWA1ikiwmEbSkPNPjnVVmNzUsMEooXJowA/6GLj88bZkyRxO2EAmlfaz2na
         uXbdMBl5SodYZBz7rUFRQvXJpTfqmrd9dUr+4TkjGSU+YuPTKoIVLCdEgoHykQcnSOPf
         jr7w==
X-Forwarded-Encrypted: i=1; AJvYcCXt6rlBEal5TZiy9oPMJkbB7rQYpXYUejd6XmIstux/CSPraKG3jVkoSd1ka2jo0ICcG2SuKmo1lBypuQhvibczOhSd
X-Gm-Message-State: AOJu0YyTV9ep9vXmv/iZFxxGw6U9U16bGm+H/SP6yoaL87rX58SIWF++
	mAZBi3Odag2qUXDzi271n1wwE24acK+8iYob8S2EKT4gstQfDaOh7lt6v8JKxUPJnwkRc68Ushj
	8caNLlXUVdwZNXQ==
X-Google-Smtp-Source: AGHT+IEXsQTn58SjL0AXbnGAEQZAHy7tglhTrT7s6F3JP4JY3Y5iTZNaVZhMJrCPYpvtxpls9D0HyzeJhRGHDfY=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a05:6902:18c8:b0:dcd:59a5:7545 with SMTP
 id ck8-20020a05690218c800b00dcd59a57545mr879392ybb.10.1712641031555; Mon, 08
 Apr 2024 22:37:11 -0700 (PDT)
Date: Mon,  8 Apr 2024 22:37:01 -0700
Message-Id: <20240409053704.428336-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v2 0/2] fw_devlink overlay fix
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Don't bother reviewing this patch. It needs to be tested and possibly
refactored first.

Geert and Herve,

This patch serious should hopefully fix both of your use cases
[1][2][3]. Can you please check to make sure the device links created
to/from the overlay devices are to/from the right ones?

I've only compile tested it. If I made some obvious mistake, feel free
to fix it and give it a shot.

Cc: Rob Herring <robh@kernel.org>

[1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
[2] - https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
[3] - https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/

Thanks,
Saravana


Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix probing of overlay devices

 drivers/base/core.c       | 23 +++++++++++++++++++++++
 drivers/bus/imx-weim.c    |  6 ------
 drivers/i2c/i2c-core-of.c |  5 -----
 drivers/of/dynamic.c      |  2 +-
 drivers/of/platform.c     |  5 -----
 drivers/spi/spi.c         |  5 -----
 include/linux/fwnode.h    |  1 +
 7 files changed, 25 insertions(+), 22 deletions(-)

-- 
2.44.0.478.gd926399ef9-goog

