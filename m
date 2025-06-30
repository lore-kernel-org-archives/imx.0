Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EF11DED4C
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263423; cv=none; b=I5WfTVDrF+8aaGLLhbEojtVf8xN8JwrDqpSIzV1DFAjAjAQxd55mCFhSaYC3lB0cZ2ncBa4ZDwHfjFPgtskwTMoafDyeBEVZ0cDcOBlbBa8Pju0WxxbhlwazrPkNM0qI7e6JMPRcP5cGmwLv+qTZHJ7mUtl/mC+61RHPVPA1TCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263423; c=relaxed/simple;
	bh=f/zHXizomnK/UoSQHyO9l1UbojaOXQHKnSqbjwtbLDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNl/Um0L8eFe0HgWX4tTYhyK+U6EEWVrbzD5TWldzCXUNdk1ciAIbGVSXzXCw9jbl3ExKG1zlRbGVa2zBBCnPjV4p6T/9BIHfWdwcpEvKdrwpG90mrSX99AVcodTzVSPyu9qw/DYgUl+yj/l+DclT05DioyAQ+JSOhosoGdQAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjqwE7SL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjqwE7SL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7490702fc7cso3012780b3a.1
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 23:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751263421; x=1751868221; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bse0HiUeq6JYWCg46lscalLF5Ni0rMUFc9iwtNAYDtk=;
        b=DjqwE7SLHQmKKzmssQI+/PVs6Zd7jiT9e6KodHw+j4EAPRKkf8hebBmfvdarBxDnNM
         IbmeRoDqGkfbdOiS2xkf11bofPoI1cY0u0AEjEpuB5ehWbWW9k1RvzlsuQaby7gei2ck
         JL7sLEAO059bhe62MkrcQ0/eU/VL1du5D+67vaeMxv4Y3zyjQDzqJVg+HhOIB+j1c4YX
         aZrXCC+Un50/EApLzyb19Xmo805rauIkzHKaok4+1aJ+lkTfSg9MvoNSdXNSx9u47v+N
         6eX4ahuUHo1iXHnYwYrg23sZJSU2Q5vPHC4ghW0LstK4h2i4JtQXzM/HyUUztqO4mqKd
         d/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751263421; x=1751868221;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bse0HiUeq6JYWCg46lscalLF5Ni0rMUFc9iwtNAYDtk=;
        b=rKVU+q7IMg33j4kMlRAOpC5Y9v+I2VRpTwMW70hpvxytNz5o8TEbHEyhZ5oxskKdk5
         VldoF2MMbEHY6pOlj89NdUymCH1BwnTdEFgWfR1h591HoU75JXgWnKenKsIX6upuELxQ
         MxmQDWuTW9jcqkFKmeEN4dR5/945mM/wQeSqgxDhW8H2mLHHkk6rWaiQ1LzixCSxyi4F
         rwn2Ir655bp0DcJaFXePbwJi4NbgIomfzLDnUVU8a9KO5kvk0iAZWAdtpe/l7MdRPMrx
         Ak7oNrgTpIQo3/7jPno4zlWXpZw3Ogin4wbGBnv0hJWkA6o5Yal+kd2Dt1JlxZZbZuO3
         srfA==
X-Forwarded-Encrypted: i=1; AJvYcCWmVYQqeaFfVuf5tmFSahHnQ57uBQZDjgpkL04pJIT0bAdeRIEmU9PQgx5q+UoagrAKDB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaAmiDjrROtzbgFulRYYRBsCxIewid7dVKQi799YF80sNczEQ7
	mYVPlrNyPhQGNNwhoehzhAEXMdnQCQt3VlGQ2ytXKm5fU45SC64Td4Fi
X-Gm-Gg: ASbGncst/txVSrLVFpwcblp4CLd2dr74yQO43y9WHgnGe5Kq0y2TkzWtGzGDugaKw8v
	+T5hq8jEUar8x2ATmvwfQzc3tVU+mxznUEyNDSsXI7gC7Vr+UPBEVANMNhBe4pZJjWBYYuKfJ1S
	uj3XnZs1moKIt1qpFFixrJIhMw3Mw+HZVziFHhGIgW614V9VvD5Kj0h4iIIevW7qXzybFLe/nno
	WEM9hWwtgjUoGrlpc2c1aW0LWYPuC6yRcM/B8Fq6nKuFKvYlmvaJKFW+JbH9BE6rlYYTZXz0/vd
	n8mxXg2PkN+dzoPB2uDlhpJ0zcIZoQMs3IyrQWQb+I0S1BGpB7R71igFKzUgQg==
X-Google-Smtp-Source: AGHT+IFm5yoCw+BqcmmIx/EQrfxZmrjUID6nD8bqIItfY6Zwvqn3vWo5T3yKwPuH6tiYN2AHz0yuxg==
X-Received: by 2002:a05:6a00:14cb:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-74af6f4cf11mr14845678b3a.15.1751263420849;
        Sun, 29 Jun 2025 23:03:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3a2sm7976071b3a.104.2025.06.29.23.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:03:40 -0700 (PDT)
Date: Sun, 29 Jun 2025 23:03:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: tca8418_keypad - switch to using module_i2c_driver()
Message-ID: <dhb2wzrhspbjh2gbt3iny7odsrpq2bbqldq276zuxwc4bnhgbl@qkbxj6yrihqv>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

With kernel supporting deferred probing there is no longer need to play
games with different initcall levels trying to influence probe order.

Switch the driver to use standard module_i2c_driver() to register the
driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/tca8418_keypad.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 76fc19ffe21d..68c0afafee7b 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -373,18 +373,7 @@ static struct i2c_driver tca8418_keypad_driver = {
 	.probe		= tca8418_keypad_probe,
 	.id_table	= tca8418_id,
 };
-
-static int __init tca8418_keypad_init(void)
-{
-	return i2c_add_driver(&tca8418_keypad_driver);
-}
-subsys_initcall(tca8418_keypad_init);
-
-static void __exit tca8418_keypad_exit(void)
-{
-	i2c_del_driver(&tca8418_keypad_driver);
-}
-module_exit(tca8418_keypad_exit);
+module_i2c_driver(tca8418_keypad_driver);
 
 MODULE_AUTHOR("Kyle Manna <kyle.manna@fuel7.com>");
 MODULE_DESCRIPTION("Keypad driver for TCA8418");
-- 
2.50.0.727.gbf7dc18ff4-goog


-- 
Dmitry
