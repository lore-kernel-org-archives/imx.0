Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1054D529
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662567; cv=none; b=smbuy6b7erVcjggm0E6wp49AN29kdpliQ5+E8FezXZ5xC8NdCqisSCHUQ8NkSnGNkRPvnApx6mKf5zNIVjy3y3nHB/Q/8m83NeVwXfVgYuaerv9Q0g6us5zSuJrHntyqGDymbKg18P8pRjsYJn8IYhFgXZcjJb3djCUZFgSE8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662567; c=relaxed/simple;
	bh=qjtBHpJPwoiEI0Ss/TiZRBMBxL2W4LWb/70qaMWWLz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=epn35ddkZYQvJaFsfqoYah+bYkq39zvjWyG3K/BMgVD8+3rABnGBV2IbbgX1PoZ2Lg/B9j8jMguVqf2jpYHRpC8FJi1Y2tgvLwgTccOXsSr9tmYm8r5RwKIHz4XlFDPBmQ0RNj0oZ93w3TgnMAJK/EN3W9uUaa74YWjADrpu398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=FgAzYHs2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="FgAzYHs2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45362642f3bso4890095e9.2
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 00:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750662564; x=1751267364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=;
        b=FgAzYHs23wuEvnikVWmk+WCZZF54Q38QHk+jBzEnKksUioRwNF1u75lNIZVcSvT9xL
         cY4AgnYOzDwzXQSwWnKdAttKuXybsGgtwChONO1KsugIKTnCFr1zXyY0120Ej5S0XNJC
         R6iPgaG/mcodfst7VVvgvaUtsIIMiT79883zXeq4aLJn1xQG+FZUTuzWfjq/LW3yzUvh
         EFZDEhQHQUvIxhtJkqaAMVZRpbOVHy22c6FCEf7bG1rTXb5JJd7Pl2kCTD2K9yNU0Z7T
         aWadX4mRoz2bKKrxt7L8TKlYMsj21w/+iY6Fy+Vf8HIYm4YX9IPWlA8GGx5sVQFQGaLd
         U3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662564; x=1751267364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=;
        b=XRrd2zGxwNCA92NrqR4QsPqPFrLcrij1cvuAC3iDzJiXekfNxifX2Q9d7Z8SLzrtbJ
         8ZsyiDse0a/d4Orch/vWl6Pd1Ybp9NtdLKsIC5trzvKobfAiNrKOTLv55pTay1hvC4kp
         xOQypTwJCxVuXEyxbt6A8sb+HJ14tvHmPem5piGrdJCEf7K3ds186eV7y+dKA++0CJ7O
         0BCqnelOMk6KRaZ35DFmYe6cRXj561wQCUe+rjQokhG/by/KxU4LiqG/vjA3+QDog+Vr
         l/Bi5FKP1RN6OwcoMPY5g0tF/uePeHynGmrdRG2n/GUYD7gR+3WSb6xXBd7sLUJwRymA
         yoJw==
X-Forwarded-Encrypted: i=1; AJvYcCXe2fOvODFQ1ttm6I/WhEo7OwmkxDtlFnORd1EHOXKmZNWaMKc26L28/98cLzTiHymGb24=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9bGM+Lgq1q9r+kguYWzZ1MMf0rlYObNh1qdpYkOFGWMeBy+9S
	0HHS/14xka4wBuQI5Gx65XZHqurdH7w7N5SXZNmba0knRoUkjpc4L3cEbNvcOHbZi2FmLmaX6bY
	Xz87wq7clPa5Bv795A1QedggnXjjHQaHytrUgZdGMbngvkls=
X-Gm-Gg: ASbGnculki+idG4M7V9OWVynhs5wOkwB4ixKCeMPEu/zYSQKcHfQotMVrsfqYX0XQOS
	x1U3Pr+TH+gGPLNBhG8FHCcMHRmeE01j9Dce0K2FUGPYLnXRMtjQ+7sR6zJenROlrM8tUNCzf6H
	nzr47VHBSrehdqi8nuwXbCFE8gF3X1GGvG3kwS8fJm7sZBo9PhH9bKqPbMcpfODa3yBQc/ZBsmB
	rpz/UD2sp2D8gNVo5Fja3x1KNK+VTqeRMsCg1aSOIX1pNpr5T2SWjlwDQ4rwj/nae0lO2/85Ndx
	NtDbnGn0PMqRWd+rvPrhgizExgPGRP0thFVAJqO0YB13CKdvAjljtDXKL3kleE09Dcw=
X-Google-Smtp-Source: AGHT+IEI5NpQNUMy1aJAjdYtizFyZ4FhXhpX1D2RY5hWJP9EHsy+nQxupmDpC1IL2ETakmaeoEEB8g==
X-Received: by 2002:a05:6000:210d:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a6d1319d8dmr2308687f8f.12.1750662563989;
        Mon, 23 Jun 2025 00:09:23 -0700 (PDT)
Received: from steffen-linux.. ([24.134.20.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm102070475e9.1.2025.06.23.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:09:23 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 09:08:49 +0200
Message-ID: <20250623070901.1733755-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
extension of the "mac-address" cell from 6 to 8 bytes due to word_size
of 4 bytes.

Thus, the required byte swap for the mac-address of the full buffer length,
caused an trucation of the read mac-address.
From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14

After swapping only the first 6 bytes, the mac-address is correctly passed
to the upper layers.

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 2 ++
 drivers/nvmem/imx-ocotp.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..3af7968f5a34 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..63e9974d9618 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
--=20
2.43.0


--=20


*innosonix GmbH*
Hauptstr. 35
96482 Ahorn
central: +49 9561 7459980
www.innosonix.de <http://www.innosonix.de>

innosonix GmbH
Gesch=C3=A4ftsf=C3=BChrer:=20
Markus B=C3=A4tz, Steffen B=C3=A4tz
USt.-IdNr / VAT-Nr.: DE266020313
EORI-Nr.:=20
DE240121536680271
HRB 5192 Coburg
WEEE-Reg.-Nr. DE88021242
