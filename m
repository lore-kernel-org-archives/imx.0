Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F981B4C35
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688781; cv=none; b=SkEmx7wFJB4PCF6Ar1jdDK2OHfsxTGWXJBhoX302M+3N1/4SbNTRy3IF8z3vJgcWbhyJAb2MJkGQiZVoiP8IpPAGXVMyeRvaiI3JpptoNihI6kA+JGwKYTh/RWZU1Tjfhe1/YNI0wvv/5hQJB4G8wsPK7+YzQfU3XXEHKST4QtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688781; c=relaxed/simple;
	bh=XKxgPXkqRoVDNfOxWtITwzSpA1j1CzTTW6TU8zpRG9Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F8+EGHfmdYh+MtpGw2MAYVdlEIXWq2dcwA8W6rl5FWW+0m/Fcotak6AaJvPyrm0KJbHysOIu+l2kXGO2GzDpuwC3f0oKF4eeZrHy4gKzioiIp1f3MRbsR1yc/4wKRtwEmd2a3ZyO8Kv+TbTVqCH0PgY6s5fY9z5qzKTsx6JVPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4lcuGeY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4lcuGeY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso598795a12.0
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688778; x=1737293578; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=;
        b=N4lcuGeYm9DurSB6gehO7j/YCtyv/lFZhPEbfh5PDn2G9/tq+RX2oX44CvqmiZabQ0
         pzm5rub8NPnuWj+gXokx9vXkNvKqfrZOOyORN3jmjrn9/xr0llHbkvtr1dzuaO/cBJOj
         rbTvbBaFw7fAVKJQCMNr1Nolz+TILAqFyy+gFth9vMLQAqWwIdIrt4wgIuoqYXHFILi3
         2KKOlvZjMJHAHbkyXgcNn8Ut7O7z9E6pUPTqZjf/EDlVmbDnKz8WmOnC2gDEVsg7RN4g
         OGeZIYSuRHjecfsvLx8tkdj+HGhmTosKv4rhBW8wK2SXfIZFA4p4ZsU/YMZEXKeQkAtO
         ro3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688778; x=1737293578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=;
        b=xH6wyccemVMVm5fCQNXgrqtrbXMQy2ndK6OQ4AN0HYfJQkSm0qhd4QcKcCLUG8rbzS
         ih+diNYSctOrTA20GAl80MwRkfX2POg92MAOfaf5nyL/QMDlRtVhCKnt1YtIDS4GlCbH
         8t+ykSooXB80Jtocc0tGfpiiqH8yVVrQtFuayDbBTeDlNksSJWtPjHy1mgpMMyjIiPle
         fZG1GNmSpk2LZnTyKQCm62R4CausQ9satJz0PfQ6gRQTasbCcRWDkk5qk1bntMcRQfDm
         uocemo+x/hkajR5GGyjqhVrTv2ZYY28TbTRIgpYvxEoT7UC94vZhh5UxeaUorqIVxnxW
         8O2g==
X-Forwarded-Encrypted: i=1; AJvYcCXCGwNa3yuvP8jAA+hKWeSjQ7qlR6i4RNHEFa/7buhxKOe9JVQbcRQLGcy9TT7lZHw6cSw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVUdDwkkBHcy3vT/hoSUZeS1UNkZvgtad9qhqTH8dh/mihtwkC
	9hhStZKEw6OgsOb4x7W4qFB/Tijz8kjTyFQq0IzsQm92UMHnQx0nxFstT6UT5oRxMZWZZ0F4wXJ
	T
X-Gm-Gg: ASbGnctnD1b1QQYbU4oNd1zfDks418ocAOzTINfchtju6EZiPsWA1F9L4pP8BfLfvBz
	kO0aeS75PdlCcY8zMSRXZlFm+zJcDfLSUSRT5TssIKFZ/0UFU7qukYqcvDhF9ngDWYftgiBYm3P
	ocGOUQzHyx1NtffONoe6y8I3PaZcG9a5rAUdkXmxOXDJv3176uY04rF/7FUKmvjwoc33NnChbg/
	4C7gYLUbdO/Jkn411pBaOgbkST5WT04YBQRTgo3d4UUBRtV6WCPcf68jybkds7Sg2wj9q1v
X-Google-Smtp-Source: AGHT+IHGPI5G9xAGCnu9erfmrPb75d7mnwukM12RbyFiKbkogF5yX4joUi45dN7aTJobJQAhBKZ7tA==
X-Received: by 2002:a05:6402:1e8e:b0:5cf:f39f:3410 with SMTP id 4fb4d7f45d1cf-5d972dfaf04mr5579529a12.2.1736688777399;
        Sun, 12 Jan 2025 05:32:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:32:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 0/5] net: ethernet: Simplify few things
Date: Sun, 12 Jan 2025 14:32:42 +0100
Message-Id: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvEg2cC/x2M0QqDMBAEf0Xu2YMkoi39leKDJKselFNyUhTx3
 5v6OOzsnGTIAqNXdVLGV0wWLeDriuI86ASWVJiCC63zPrAdFhfltYzpAx7yZKzYuHl2ybUIMT1
 A5b1mjLLf5Tf9BcW+UX9dPyiJad9zAAAA
X-Change-ID: 20250112-syscon-phandle-args-net-386d05e2cd7e
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XKxgPXkqRoVDNfOxWtITwzSpA1j1CzTTW6TU8zpRG9Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SAA643Zo2cp/l+bcjvA4yh2jmRGdEETJsAm
 Enhfy8ebEeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgAAKCRDBN2bmhouD
 16MrEACXZ72WUcShffV++I09qMxK0HXHtn8vUtnKitu0FCIocOPj/7yXCn5UNkwMiowlUD/SJU2
 eJcDaunCkjH8J0KQfk7GFxGX5vk93eYQxv0HlD+RMRxaKnL9IJJFTwy7UCU53xCeMtLDPVo/iO8
 GHcTw4W6rf9JhAdFzQAzZCXIyih19x9F+wejqS6Q1gbhTzpQdH0zpZ2eA5iOE9U/D1m5rfzBZDk
 B4CBqgq+Km8WkZvkDsFtGQLV8vHiL8OxkQa9UFtrUOzVTyLmgh4iuCLXVz4qgeO/AoojroJ6UD9
 UqyQTPPbEevML2onTmd6zO8u8P35sCy5mei8XuP6tTx/9xY4zj8vUBmIgNnDJTd1cdWIRpCaG2j
 ASmSe/phuj/0Yn7KYirpKOECOZkvSWcwS0ScdA4DTLxpnwGyacg3B+7MZc2TcaLQiNtfKO26d5j
 vaQiFJ75DmoCxwQabf+RYQ9umr+3c6yKY+pO7BC5z5DTLPv/NXBa8xTJNI03dK8YQMIC0dDCkpl
 qxGQp/Vb4x8lv1ftODbrjU03Z4MWTeI6ahuBLX5mJC+L20oY2fVmZ1vIL6n+9noDROXO/WrRhD0
 DlJiC2bxqKx7hcdSoCThDAzy30sDLBihn08oRSXZ0t9wxIhbCZYyeVSq539LUav3T/PLQgdIMwh
 6aN+wRTr39PFWGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      net: ti: icssg-prueth: Do not print physical memory addresses
      net: ti: icssg-prueth: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: imx: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: sti: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: stm32: Use syscon_regmap_lookup_by_phandle_args

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 10 +++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c   |  9 ++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c |  9 ++-------
 drivers/net/ethernet/ti/am65-cpsw-nuss.c          |  9 ++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  2 --
 5 files changed, 9 insertions(+), 30 deletions(-)
---
base-commit: 8a7b73388d7ab9aed82d5b81f943cc512ee54e9e
change-id: 20250112-syscon-phandle-args-net-386d05e2cd7e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

