Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380761;
	b=sULxDUYsuYWg6O6PDkAVTNw+yzlPDghGF8DD0wxWpCm++IBGL+VNwBA/HE7Ysc2j+/sA
	 QlE6P+dcTROPejFmbLQNT1CY66TgfXd49Zey4IsZ/VTZoX7dwOiUKtbMR4xtkduPCMzEb
	 NafAU/R5Jk1IFeFbPJIJrZgNr19SfG2HNjJPAiz5ZocWUR+1dm3zlhQ9rayeun5F6XI+j
	 UMp9qL1FX+kdgH/MCYPvvQDGZMT4+mlEFDEKqjU7Y8ZRD4IooXUCCHsHpiNhkfOGHmnqb
	 7zhQQrRJlAmNeLTwaKXzu5R35VDxbGiXYBIhkOjLdsMFgsimFEEIiyd1CP2l+xHiiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
	b=hh6fjSEVl9Q3ED2u4k9HD9Jnuq9oPaoWUlPHMAuE1KQ5PMDxyE3O2uv3Bk2I3S3UYVNU
	 8r3lNNCANcBClEzE25uzYjZunau70+eyTgq2oukxEkTATQlDrZvrYB+XS1EdpFGmDhzjl
	 mdJ4lfIVis/xBUU2iJU/1r4P4FhhN0afL6zE99kr5/giZb6CZVZDUCWQwoTWiW+/9OSmT
	 UaOWWbTEhGt4DuJdiKNgLeBzIiISTL6aMY5ZC+H8/XihIHUft9NW0aiS2K9naIzCeEyPl
	 +ZbCmjn1xWnDMe8/SM5427JbofOzIhW7DwV6iy/I7sDmH5jHVFtwlRtLiEWN98jr28g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VHTQX2XS;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E84606A31F
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E84606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VHTQX2XS
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9040065e9.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793380759; x=1793985559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=VHTQX2XSdpxofbIhXvrFO+YKWbmstA2jBFOSAts6oFLeXfZDEFPElG/SQnYX6TISoE
         QtW9/Uu0KKHJPdx2gXqEl/YwePWdjDXKw0DTi3g3q7g3/JTOF60vvYozqzHZYCjl+9Ey
         WiYh+QVHImWH/VLetLk7ygB1ripZhFCxlZqXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380759; x=1793985559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=O4PASMGqIvU1pZx+/193pvV3tJ+fn1TerJ6hTWweaWedqWkOGJZ4y/VLmwxjd/Pzfb
         pPU1oZ9aZ0NIg7axNL9i6BZP6dJqQUDUFDXTYwt7NeS/qcc3ENUenF9bMHBWkyUocG4N
         mhzo8Wx8IjEuROYnD6+GgvHmdYMnbp/yS5xI/T96dS8YsNMII9WKahgnJWDW1/A1+Ho2
         0+8Ety3K4rflcd/FabRuQq+aN6ep81zdjFzmzngVFtUircQDdDTKf+SswKivLq1aGpGD
         /wKJ/13vyMGB/rDsD91Zy6pTQcM8DYiQ6C98kfO1JLxVZsPrOMOXvwUTZLkZw7y1UQ0D
         09Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwj6RZB0P2iV/4CqJqgdBPMbZneQljVmrccHkDmZSLW8w0Tyc4/4qW62/Bbn+nX5apL6bA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJD4t2tsKhJLe+eXNfNw/8c+cCUiDJ0JNH9ccsZqtdwxnQOR20D
	voULaPiCRsqhD4ZS9AQTGJ5F2bIb8IgAfLHRUui34sfk/I3DvPQcfMto0wop7ja7fZY=
X-Gm-Gg: AYBFou3t3UyfD/RVvdGyf0B3WPwMiHW4AsiOMjSw36OW/tqXXgOSSwbdTqN2zj4ZTc9
	h4VE2xZ4FEIs3Zsl27OAlHsiBK8DD7HIz3ZYSbwvV1uTqtts9T4EvpSPhmAYy1ViHaHbWItNTYv
	Y4MLaE1ZLJKol6IBXm3a/NWF1J+eP83ilNHjxEFGck3sv6SUN1coO7mBBUD/TSJNQEV1lLzhnhz
	K3D10OgUBGU089LKoep5hJGx3YRusxO5nbkAU+mZ8UqrzZOL1tF4KKonCO1syXV4F8X5NeMfvKv
	cUznKXGWFJMs4CesQj7ifbHlNgq0WZkHp7WXVcIPVQH4iy5R5GVd3t6hT5mctrudOFcM1wLpXIE
	jhhnvDi8g9zj+Zu79SwB+yrx1RlEMlp8OK2PiCi9BRLH500F1GqopMLOzABPk+1q4cupuDmc50i
	OezfW2muOmKhzr/Nrc2loIdAgz9LllBlwA0EXDjlnH4ZzzXAkfh1tp8Vb4aQ4/pgJvowbP8mD3I
	Et+dKpPl9Zwd7DRlBxfoXf8ztebL7E4CsUlPq6PlLk6TZ+JrnyYq74wPOsHHjXSLSAS1cYqdR2N
	Tci4W4H2XFwrtU6LeP+UH+64LccycGs3eLGPVpWCu30+2DKMgQ57SSHhVfZ33QJaYc3RZXEuIu2
	XmJYk4KFaNYDmORWPSMMI3ZYMemJE41Lhk6ELNc2PW+lrt/YK1Xs7vxayqPxDfiLIhpFyHvW5O+
	5ob2OE8f3t6I4vrMeh1ytxD0hvPw==
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr70600135e9.1.1793380759329;
        Fri, 30 Oct 2026 10:19:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm74252355e9.2.2026.10.30.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:19:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: dario.binacchi@amarulasolutions.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	coresight@lists.linaro.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
Date: Fri, 30 Oct 2026 18:19:09 +0100
Message-ID: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ulf,

on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
watchdog resets the board, right after:

  [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs

On a good boot the next message comes ~11 ms later.

About 1 boot out of 3 stalls or hangs. With cpuidle.off=1, or
with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
earlier in the boot sequence") reverted, 10 out of 10 boots are fine.

I haven't dug into it much. The stall seems to be in
pl330_driver_init(), so my guess is that it is related to the AMBA bus
reading the ID registers of the CoreSight ETMs while a CPU is already
in cpu_pd_wait, but I may well be wrong.

Any idea?

#regzbot introduced: 65705b18162b

Thanks,
Dario
