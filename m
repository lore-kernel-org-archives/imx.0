Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934A1C4617
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 22:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806765; cv=none; b=hARvUPvAXSwL6M8ZvFz2BeOLUKi5ZC3cNkuJk/8mBaJ2byMj2cUCb7Vqbvh7oDVfEV/tnEOOi0HnXY43YTe9a7CiSjvs68uxNK4JVH7gv+zwlRgnU9Fp0QJlNmWI43u6d9Hal8UarSC7gst6P56bkPdMpciM3xNb9v1CILRKViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806765; c=relaxed/simple;
	bh=UEfyMNkflJZ2fhNc05ylC23IiSAozSl7+gLNlTjVK4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWXwGy21GSuS9zNCVdhRNtdBjKJ1Jx3+QYUuMQFcHqZcxts8INLVODkBukkJ8NlvZjgPXl+YUe0sGvBF/3KHxck1tN5ShQLI7pVjtWE3KLh4+L8OYr4NoKaF3dWn9XUbYHaa8Jg0Rb0+EDrsIZET4TkTpdcHiJtCGV0QvzHOpRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005yk-7t; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYg-2A;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2d;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:19:10 +0100
Subject: [PATCH 2/4] checkpatch: warn about use of legacy_static_base
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

gpio_chip::legacy_state_base was recently added as opt-out for
existing drivers and shouldn't be used for new drivers. It's thus
sensible to add a deprecation warning whenever it's used.

This doesn't fit with the existing deprecated API check, because it
requires a `(' to follow the symbol name, so a new member specific
pattern is introduced instead.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 scripts/checkpatch.pl | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b28ad3317427a6bf9e27b77065aa3915cb13053..6c57a08833a4298573c7967b2a178fd7f46aa7ce 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -848,6 +848,13 @@ foreach my $entry (keys %deprecated_apis) {
 }
 $deprecated_apis_search = "(?:${deprecated_apis_search})";
 
+our %deprecated_members = (
+	"legacy_static_base"			=> "setting .base to -1",
+);
+
+our $deprecated_memb_search = "(?:" . join("|", keys %deprecated_members) . ")";
+%deprecated_apis = (%deprecated_apis, %deprecated_members);
+
 our $mode_perms_world_writable = qr{
 	S_IWUGO		|
 	S_IWOTH		|
@@ -7407,8 +7414,8 @@ sub process {
 		}
 
 # check for deprecated apis
-		if ($line =~ /\b($deprecated_apis_search)\b\s*\(/) {
-			my $deprecated_api = $1;
+		if ($line =~ /\b(?<old>$deprecated_apis_search)\b\s*\(|(?:->|\.)(?<old>$deprecated_memb_search)\b/) {
+			my $deprecated_api = ${^CAPTURE}{old};
 			my $new_api = $deprecated_apis{$deprecated_api};
 			WARN("DEPRECATED_API",
 			     "Deprecated use of '$deprecated_api', prefer '$new_api' instead\n" . $herecurr);

-- 
2.39.5

