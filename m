Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6646021B199
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739804269; cv=none; b=qpSDT2UMGQ/I+Pinao3VFv6/1WNtJYcWSVhNPVu8tQa7q4Wstlcq4jX6kqcfsqDjupJi0rehiSkJlPJJ3zZW4NSaIGE1zvwydhmxNHNuTKEQC0JBf8SwopcfSivRTZEd9RwiJ4bp8yNlPRAGxnZ0YCbRzDuaaktKNHS8kQ4y/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739804269; c=relaxed/simple;
	bh=qJqUYoEZSlIY8ZZFK2NOtBT4skKZlYw/05gC7EkpVck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmnLD6yFzt9fpGHdqJ5HNhxUAFDjWCqQkQzfIdXqDDzMj8sJp5NAlWRP6DJ/wNKqmlUhV1LtyERwqcbclIFFTKcZB5/Se8FJdjhC1ceKy/YqmeKyPOLA7U7b8lVWA9jjm4F+MZV4RUQHkvJVs85g/CIv0znbPGwFZ8WT/oN3NF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq5aetCk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq5aetCk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso48752165e9.1
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 06:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739804266; x=1740409066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXoBLoBhkmHAsPATjYXnbeVHXKCoJYAoeA07HXhsnTQ=;
        b=fq5aetCkUxGsgWhwCyweBzY6PNwDsrkfxEHHhdF+WxC7yKg+b8mxtKkOpb+p3yrA2i
         Ua2m+OfDtamPTnb8ritsYLslR6MJh7jhjrR808TeF+1Go5BKf+6TPsAlTDa/Xgz74tDI
         hevB2ex/QZZOfLunBxQUb+uiuxilmySu8F6d//IfpEwrH6jeck+lz7kUqqF07jxrFpJW
         GRQa/eR3xC+mPQgEgnryvb+tdCYWaV3PHADTZ2u2FgbrUuMyj0JHKbX5ZB3ucnj92a45
         RskCacMWkLkSv/Su7wNKsQPswKDzWaHaIgA24AH7rTF5D3UT9MsdqznILkzFmzL3lYly
         Ekew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804266; x=1740409066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXoBLoBhkmHAsPATjYXnbeVHXKCoJYAoeA07HXhsnTQ=;
        b=Fo8pwr7CAwvcgYd6Af1nFQUj8JBCHlFjJxy3EXiPsORaWMtFH5BmRMKCTscasC5A/x
         LF7cF2/84f+xnx7vG4ICWxmoEH9ChW5/znznDZyXa+c8iQovLSYdFgibXGFIvvhAqmId
         7ngTSfO5kK8tE3mgNZ87h8Q8OGMxLAsJriJJJnDLFgjGY2AIkBl6yYiOb1UK8Fu44StM
         0+XUqPcrUeVB5VuO4AvnvY/By3ZGHlxYOk8KvvIym31TzpPcTrfXKxCQ30KJNoFJT//o
         1HDaZ9M8PgAOupz/W7V5HrKrtoyUDrdXRXXJvuScK4csj3I5NxxO69vQrUwwF2eLqgw+
         Gw4w==
X-Forwarded-Encrypted: i=1; AJvYcCUpT/0QlsdjNvfpDniABcqbCAu77u0bdS4rbksNMeVq0/iFA243B2munewFTeihwBXKcf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA995DGEwmf0sSpCFOFT6jHkKPwdyhf2RflKXaiEdoSFni63m6
	vNFlG5M39EMDosWh9mb/6izh6OsjFlFhxuwoe5DQ3N5gD4pe2c+y
X-Gm-Gg: ASbGncvJLGhWAfznMMOfpRksRIkZPUP/CGyughmwmDPCJXmBoxW+P2XDTpoSiX1cS5B
	fLKUgA/HPjtqr+H+FfT65SRu63wtP32zNIb5Z9PiTTTRZx2/t643j1TCmaUfem/2v2Ax0B44HCm
	1OK4uTJSz+HV1bnn0F5BwLaqv4EEEAnSVKmq12gyfaahcppuwNuBMx0673YWws5aKVahyGxM7Jd
	CcX7rX+PZuYWZxlv13omcSAepd3kEr53S9sE4BLXbKobHs8HkPfIWVKv5X3cD+dLy1HA9DdsNSt
	XXMnlm/GRaKYeEAVkg6SkucTpgQwYws=
X-Google-Smtp-Source: AGHT+IFXCMAdjJ/GydfAREXf0KPq6/DlSCRVX1j0O/vO0UDb9MfjoWtFC0m9aDzP5dEgyS4d1XL08A==
X-Received: by 2002:a05:600c:19c9:b0:439:5760:39a with SMTP id 5b1f17b1804b1-4396e716e8cmr101394035e9.23.1739804265610;
        Mon, 17 Feb 2025 06:57:45 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12645020f8f.56.2025.02.17.06.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:57:45 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8mm/imx8mp-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:56:39 +0100
Message-ID: <20250217145744.179213-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds a Microphone Jack to the simple-audio-card of the
Verdin iMX8MM and iMX8MP Dahlia carrier board device trees to separate
the microphone and headphone functions.

This resolves the following boot-time kernel log message, which
indicated a conflict when the microphone and headphone functions were
not separated:
  debugfs: File 'Headphone Jack' in directory 'dapm' already present!

Stefan Eichenberger (2):
  arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to
    sound card
  arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to
    sound card

 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.45.2

