Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E214C5A4
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473647; cv=none; b=K3LVqRRAPtqiElwKmPwbW6xtCo37Rij2rMorTpqbCheUFS3s3BMZSLuOITCXGYVTHhiUMQIvFECBjay9XyUl7h49/T9fSvbK2TXZYTOI19/QUehXnVAIIL36KaU9N1oflSWZhy+vS6byyKRZlWfiN5C7YQnXwFwbHQeMOpZdcMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473647; c=relaxed/simple;
	bh=z7wFoacyox1RtC202GOEeJ8rhjY1r0HItGHJPGiueBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gi1ZXSlP9Xey3J/sZj6p0ljJDs2d79UEoJrthsof+dnYg9vFc7QxoqxYysjsg6dZLXNH5HYqk6lcsCd5QqH5NT4j2/05DSuLHDYOTWCBzVGG+/0Oqq6CASRhv0I1cYSczAaCptNj3gOKy2ppuxQPL4ERoyBZxHMyUT72vjWNkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=fail (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=i/KQvLGq reason="signature verification failed"; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="i/KQvLGq"
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 6.2.0)
 id 77e4510f5f42e765; Mon, 12 Aug 2024 16:40:42 +0200
Received: from kreacher.localnet (unknown [195.136.19.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id DB1676F0D9D;
	Mon, 12 Aug 2024 16:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1723473642;
	bh=z7wFoacyox1RtC202GOEeJ8rhjY1r0HItGHJPGiueBo=;
	h=From:Subject:Date;
	b=i/KQvLGqVMWtv4NQsEYIPSTW33FQFFtVBUFRXyK/lY1AS+v4vsV0gQ/mXOqSWq4zF
	 8WS2hupPJMLwyy0LVGoO898W3PSPuGW1EDfPEYcwlPAZ7tob5i7hvBRTJ4vzZzgoIK
	 cAbnoZZl95Goqhvua6HfbGQlg6vStBerVssX1ho3jtxIkcjzofZAU+vFEBt9PmVWyX
	 Y89tQB7zVJZ67G+PyROkSa90+NlruM2AJSzkG3ic2JSJm0Sb9eMWIXu6J3gxPVaF8y
	 ybFDxGlYw6jEaKraIwOmBz3NIH+2tDfdMp46U81k3W4Z3nylg4/Dp/fQhphIB9OJmx
	 krG41Cx/QLSmQ==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject:
 [PATCH v2 11/17] thermal: imx: Use the .should_bind() thermal zone callback
Date: Mon, 12 Aug 2024 16:17:06 +0200
Message-ID: <3273538.AJdgDx1Vlc@rjwysocki.net>
In-Reply-To: <114901234.nniJfEyVGO@rjwysocki.net>
References: <114901234.nniJfEyVGO@rjwysocki.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 195.136.19.94
X-CLIENT-HOSTNAME: 195.136.19.94
X-VADE-SPAMSTATE: spam:low
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddruddttddgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuphgrmhfkphculdeftddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepfeduudeutdeugfelffduieegiedtueefledvjeegffdttefhhffhtefhleejgfetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudelhedrudefiedrudelrdelgeenucfuphgrmhfkphepudelhedrudefiedrudelrdelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleehrddufeeirdduledrleegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlihhnuhigqdhpmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhukhgrshiirdhluhgsrgesrghrmhdrtghomhdprhgtphhtthhopehruhhirdiihhgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-DCC--Metrics: v370.home.net.pl 1024; Body=50 Fuz1=50 Fuz2=50

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Make the imx_thermal driver use the .should_bind() thermal zone callback
to provide the thermal core with the information on whether or not to
bind the given cooling device to the given trip point in the given
thermal zone.  If it returns 'true', the thermal core will bind the
cooling device to the trip and the corresponding unbinding will be
taken care of automatically by the core on the removal of the involved
thermal zone or cooling device.

In the imx_thermal case, it only needs to return 'true' for the passive
trip point and it will match any cooling device passed to it, in
analogy with the old-style imx_bind() callback function.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---

v1 -> v2: No changes

This patch only depends on patch [08/17] introducing .should_bind():

https://lore.kernel.org/linux-pm/2696117.X9hSmTKtgW@rjwysocki.net/

---
 drivers/thermal/imx_thermal.c |   20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

Index: linux-pm/drivers/thermal/imx_thermal.c
===================================================================
--- linux-pm.orig/drivers/thermal/imx_thermal.c
+++ linux-pm/drivers/thermal/imx_thermal.c
@@ -353,24 +353,16 @@ static int imx_set_trip_temp(struct ther
 	return 0;
 }
 
-static int imx_bind(struct thermal_zone_device *tz,
-		    struct thermal_cooling_device *cdev)
+static bool imx_should_bind(struct thermal_zone_device *tz,
+			    const struct thermal_trip *trip,
+			    struct thermal_cooling_device *cdev,
+			    struct cooling_spec *c)
 {
-	return thermal_zone_bind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev,
-						THERMAL_NO_LIMIT,
-						THERMAL_NO_LIMIT,
-						THERMAL_WEIGHT_DEFAULT);
-}
-
-static int imx_unbind(struct thermal_zone_device *tz,
-		      struct thermal_cooling_device *cdev)
-{
-	return thermal_zone_unbind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev);
+	return trip->type == THERMAL_TRIP_PASSIVE;
 }
 
 static struct thermal_zone_device_ops imx_tz_ops = {
-	.bind = imx_bind,
-	.unbind = imx_unbind,
+	.should_bind = imx_should_bind,
 	.get_temp = imx_get_temp,
 	.change_mode = imx_change_mode,
 	.set_trip_temp = imx_set_trip_temp,



