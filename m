Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1D32ED5F
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734557; cv=none; b=S48nTRKiSlX/vdYb2xdYS6rANUyw4nsOxt4WnECtvoosHJ0mw9pKpc/7Q/IXusvMhoZt1b2Iv2GM630yNU+PcTJ3zm6uBD4NUNipIjcpxnoQsLg226THLFAVM0t9y2FZbvSaNss+WhStVpHSYwkM+Ieg8rTQ2TbFOqA91gMDNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734557; c=relaxed/simple;
	bh=7gxDdxyM9gVNPiVVC4eGHnzzvY2SF9OG1/2DP5fZaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=umP+QYSd22JBSYtgccLJ67BYbey9gsCnI7vet1XXjpiOvh6+3zitybfnWGC5CXdGmTM4yPZdnTyTEP70LQ16CF1ryqIXSlkzDsgW/fL/inhMh+CsiPsGF1A/r5z7Odq8WjFuHZblUVMEtRPbD0r7F7s0M5aMd6OsixCyB+NGi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlzPs23G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlzPs23G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761734554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VO6JMeF+Y/rlXeytLrI1t4e8cSgJmr6x8lUSlNHIFuE=;
	b=FlzPs23GF9gPC/lhfI1jdg9PoHjUKCYbM9K2Da1qbXaCA1u/6GDg2POq1TReWSHbjnZCnr
	snIAognbu+wmYhhvQVjim91nPwibvF4JvnYstdp6xcsmdr6XivwgiNwkMlMFrfPqUxQV1z
	lIbmmshOPeEzTrFgVF9Z2jlh6SvqmvQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-02A6Q8PePCybPWNbRqm-fA-1; Wed, 29 Oct 2025 06:42:33 -0400
X-MC-Unique: 02A6Q8PePCybPWNbRqm-fA-1
X-Mimecast-MFC-AGG-ID: 02A6Q8PePCybPWNbRqm-fA_1761734552
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426d4f59cbcso487085f8f.1
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 03:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734552; x=1762339352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VO6JMeF+Y/rlXeytLrI1t4e8cSgJmr6x8lUSlNHIFuE=;
        b=opcdf9EqEgTrRpXuvkVq8eesd8qfsz7fJ75hkasHVDykcseW7RyisktszIVti7EzYR
         4SqAzQvvCleGIhnYWrh5RPedi1fwbGEvOYDVU2TDD86wJgPiEt9/Rzqq3n+jHhldSZzL
         Wtzf430H0QhkC+9OQq9rGTd/81lN053V75Xw+aYKmhTkWSn3xUcwsZIJXIGZmG9Uecdp
         FB5j3biwhYkjlIEWEeIoUZxBCMjBUzXkoGRQVuSVmCZz8XuCf06Fh8qhum9KYCUxgTLM
         x9APUVBJ0lZqUP0v3Mu2dsUYfWsmPGGjrDWHxuWQZQOzDq4CnLmkYAVciDBaYDStw5dV
         5cHg==
X-Forwarded-Encrypted: i=1; AJvYcCXs0wsZ7kKA6hIEFRxd/oszOYl3tLtV6z6TpIYOMFGWAx4T8AYCTT4cookxJW/wmJdCqr0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWAMxLpkq1AN1eFNGDwLtWNecOFPtWJUIhiiv3bYmWHfki1gzp
	ylTIGCyaM+ejR0dUjBJ4//LgUeCXzNlk5Zy9fGxjdxZY3Y093FFEH0dPdiS1Szc84yp9PJF8r7V
	z1/zwrLKem+xz4XpGfpnzD/icAeF21MtV43gSjWG0FOx0mi+2TpIRew==
X-Gm-Gg: ASbGncv1UjyZUQCeCIIGtOhqCTWHxCrvifgF+Qdsxuk+kB4DfYPKXiIeDfqcSIW5hox
	HB0kXaKZDXnvWh6U0TUwGNZ5cyIzW+/sqB6extJl91Zu4DZmxu8/QoNPKOShs6OCQTfsb5YG2TK
	b/4HFeUpkFfOSTsjfvPpPcFuLgh5yiwsi20mlyrTjA4BA7epKhG53JUVwSxRVy2xg01zXmge26t
	G+iaZ3we5gojbL+TvxyvWfAD2sJQyFZIzbjJZ0zE1cjhMYnAHcrfPMBYVBNaXORHln2yuwq+RQ/
	yVRpnnleZ6Ih80SyY8orZ97Hk59LPw/35VXF26dK+AB4uWhaplXHOCaY5SffAtkBMqansupD5/J
	94vHDLWUIIrMEBd4XkusaOQTGVMQ9tIhHd6GW563nhoOD/lDJ
X-Received: by 2002:a05:6000:2313:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-429a81eb864mr5415912f8f.19.1761734552406;
        Wed, 29 Oct 2025 03:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl6mj9Yhn8JAOvs+rKKdsBa63eFivbLmo5z2lKtEdDXOT0AMmmPQdmaMB5a5oRC1AheFEt+w==
X-Received: by 2002:a05:6000:2313:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-429a81eb864mr5415884f8f.19.1761734552031;
        Wed, 29 Oct 2025 03:42:32 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e387baesm40719725e9.2.2025.10.29.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:42:31 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	Lee Jones <lee@kernel.org>,
	imx@lists.linux.dev
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sean Nyekjaer <sean@geanix.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in NXP PF1550 PMIC MFD DRIVER
Date: Wed, 29 Oct 2025 11:42:28 +0100
Message-ID: <20251029104228.95498-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gdgsfl2v_voKfHnJ7sfNkZ5Bpr-20O59tPaq1J3G_MU_1761734552
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit ebaec90ec0b5 ("mfd: pf1550: Add core driver for the PF1550 PMIC")
adds the header file pf1550.h in include/linux/mfd/, and commit
a7d6255a0bf3 ("MAINTAINERS: Add an entry for PF1550 MFD driver") adds a new
section NXP PF1550 PMIC MFD DRIVER intending to refer to that header file.
It however adds the entry for pfd1550.h; note the additional letter in the
filename.

Adjust the file entry to refer to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70de2f9c4a50..e428ec79dd24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18718,7 +18718,7 @@ F:	drivers/input/misc/pf1550-onkey.c
 F:	drivers/mfd/pf1550.c
 F:	drivers/power/supply/pf1550-charger.c
 F:	drivers/regulator/pf1550-regulator.c
-F:	include/linux/mfd/pfd1550.h
+F:	include/linux/mfd/pf1550.h
 
 NXP PF8100/PF8121A/PF8200 PMIC REGULATOR DEVICE DRIVER
 M:	Jagan Teki <jagan@amarulasolutions.com>
-- 
2.51.0

