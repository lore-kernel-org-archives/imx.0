Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE92F3610
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 03:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761793774; cv=none; b=iJL946tMkI8nhVJVqn8C4lmDIpY1XBZfYxiUqVQ7jnYArHVpbP8QKj5ALBFF343vTyLD2jndLLZZDr3UPX6EmIQy0G8F0kPJ8BwZ/0AKla33mxZjgYxf/FyGJ0JfQYqUkdBAWSzqYpTK4A/AJ+eh7rsDBphc07sB341KR3Ic20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761793774; c=relaxed/simple;
	bh=+yp0oNIbPIHplJ49C3RLHC542xFtRCi3lHAph1pF8Vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AznqqnfUQQA07YrfJ5pOVQokDlv9gWoUpNutUnn+jf9MZSCpFy9m8J9cpJh/C6ugeUZb/kqKIv27uMmHAzl7vNvXK3/+5EsXi3rQQGdoseeojt90NJNX7/4khNbrZxtdj3Zc9cg7PXVJqAGIMEahMtnPYWMRgirVdpzRu4IDMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3WGB0Xj; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3WGB0Xj"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-89c81839de7so33423885a.1
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 20:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761793771; x=1762398571; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9yBtaoQMt4RjwkfwUxgTG/0MkFajbObVmdDtK6y0Xk=;
        b=F3WGB0XjtmyLxAkWq23h+ewN8zCHk9aJpbfk5PIW0NHG5/fWA4Ez9kAno5WhrFWwzS
         qNN3tg96V6Uf7Dd7gpGlA8SUnhb/G6Q+gtUxRCJiJTCYJJidVamcCdXwv9qDkLOi/POX
         wreCVVH0Aue1bczg5S8C0TONfNuIELO2e75URicv3otnxcUF/jVrz0DEqYMGkBH1IWH8
         u5dc4TWwcU1NcVDAD46zGuLDusXDjJ/b00OS8uhH98ZU8Wbbr/W0X81gvqyIONOxatH3
         dGZluhOlM+M1QUmwEUuCUHGQh+PhUsAZQKelbOcdewT1QpVz4ClWGyTy6WMDODAisJ6Z
         V3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761793771; x=1762398571;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9yBtaoQMt4RjwkfwUxgTG/0MkFajbObVmdDtK6y0Xk=;
        b=kAiRrDhPR7NkuJL9pxw0dtpY0ORoCk52FlegwIsUsWiEqV/E8D086ZFWsPPgVeY/2r
         OPQLjU9x3W4UvM12hQaGq70tQy283Emv/66N95o3THy7rXPIW6osQ/eBvZ5c5wlXpI8H
         7h5pp9lZEVqxwqnfNtqgvz3ASxgdkQZspSDnDOtgJXDRp5qVcWl10gf/bPByVoGs7FKi
         dwTm1IYOqYBvDO6w8pXxmQyMswiEH8WkT+S3ofJ6DbmS6ReHV2XDgoVMq3CQkw1JaCNT
         TPkMmjSr7++OPszpSlWWb6wvRbBthsXkTQ+q/ehvzvAthCsjjuoYx0mzbqzNVl3EA9gZ
         qr9A==
X-Forwarded-Encrypted: i=1; AJvYcCVCNw2NS8fQ7Qd7/9iLECBw9rNhQOm7JZkhYHhLmtgEv1QYt3tQqYJu8C287Nn/Gz4lvEE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEw+afnchRUqkPnnWpDA+Vgf8lkLZA0XT5mjqpRy0QoYPWlAdQ
	aivAhZmM911Ge35mKksxfNkFdJekllhYfZEnxl+zaqEwFqUBxrU33HNl
X-Gm-Gg: ASbGncuZzXrZvKuiMVHzJfax5+ckn/A3k+x1EBjJYb5WnH+gHt3+PUTTadvd+ahvKNY
	iJy5CWPQIbgCa+dVBvHMfGOcxt/B8YR59c8GG71g0kjpeOpOH8H9QGusXemPxlSLtcrT6te2CS8
	XqbGiOIfEfoS2U4mpSGpAfiZMtg4TNYadQy8G2ruSXSFDr4gKiYviHi/Xvzv682Ahu41ML0IYl+
	oaIJ3HoH8QPvi6DcREf+L3p8zxZviHKrwHO/4h8QVL3fF03qz1rXIM3OthMGYOKIAN+VtRYWQq+
	lx3aIrkQuFDpSvJynDQoRxUGAa5LE/MWfQ0Ki0Dgjg5dTdVY29FMKXaq3R5Kl1JHT+UZ1+Kt33a
	KhRYECIDfXfH1m1u6kzj3GO2IDQBRZtWUNQYd2rr1jituHtzfL3cvxuGlZvCOfwJesPf5yiG8fT
	mTlBwCyxXFyAyyLWR4
X-Google-Smtp-Source: AGHT+IFSneEe/D0Nm5OTWim+N+3MwI7PLvrIFHurjKJIj/dFQhAHVJ8uDPxnXPaqhaufAkrkxzryiw==
X-Received: by 2002:a05:620a:2913:b0:89f:8089:332 with SMTP id af79cd13be357-8aa2c658481mr270286585a.27.1761793771563;
        Wed, 29 Oct 2025 20:09:31 -0700 (PDT)
Received: from [10.73.222.215] ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254a6461sm1216363885a.30.2025.10.29.20.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 20:09:31 -0700 (PDT)
From: Samuel Kayode <samkay014@gmail.com>
Date: Wed, 29 Oct 2025 23:09:22 -0400
Subject: [PATCH] MAINTAINERS: update PF1550 driver email address
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-update-email-v1-1-f38f45aac2e8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOHWAmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyNL3dKClMSSVN3U3MTMHN00i8QkE6MUw0TTVEsloJaCotS0zAqwcdG
 xtbUA6AFtqV4AAAA=
X-Change-ID: 20251029-update-email-f8ab42d1a5e9
To: Lee Jones <lee@kernel.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Samuel Kayode <samkay014@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761793770; l=974;
 i=samkay014@gmail.com; s=20251028; h=from:subject:message-id;
 bh=+yp0oNIbPIHplJ49C3RLHC542xFtRCi3lHAph1pF8Vk=;
 b=a2wytk14s8diN6iiqQV8aaMVjzlSE7YtEsqQfx/ZJgYXoe/Usct04+SEmzwzwdqb9Dv20yTJo
 nxQCcLNAWowAqXcKYuSZVFDGndaeD/JIiJbzfPZqslyOt9/j2pAJtMq
X-Developer-Key: i=samkay014@gmail.com; a=ed25519;
 pk=favoK08ilD1j62PrGf+RHihBzbqJGWMC6f2nszR5UIc=

Update Sam's email address for the PF1550 PMIC driver.

Signed-off-by: Samuel Kayode <samkay014@gmail.com>
---
I left Savoir-faire Linux but I do intend to continue maintaining this
driver.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a9330f05e2fca6b8661bb698dea17dcfd7fc254..c44d2cf7e7b85104a6eb09142da8ef3d9fa7e55d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18608,7 +18608,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml
 F:	drivers/regulator/pf530x-regulator.c
 
 NXP PF1550 PMIC MFD DRIVER
-M:	Samuel Kayode <samuel.kayode@savoirfairelinux.com>
+M:	Samuel Kayode <samkay014@gmail.com>
 L:	imx@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/nxp,pf1550.yaml

---
base-commit: bb57b5ac4f83df384fcbc5ba38a397ca0eb91562
change-id: 20251029-update-email-f8ab42d1a5e9

Best regards,
-- 
Samuel Kayode <samkay014@gmail.com>

