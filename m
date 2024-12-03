Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925931E32C3
	for <imx@lists.linux.dev>; Tue,  3 Dec 2024 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223673; cv=none; b=syXK+ho5UGwe4cgwoCsGKpJNZ7YBCvD3b3XQl/jqJqaBWxknL/3OXh+woRKxRKUxk+0EoqWLFaHhm8BC+jdhRFcCeuHT+cK6XVLFvqKQbZwU6W4tWnenOxrrGjSUwwwDTXR/3Xlyxcv4ZbydAOH80mFKTZFRbNcVCQKV8Owf+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223673; c=relaxed/simple;
	bh=2iiyH6FfFZvtW0Gttz9MS8U6yL1ExDsA78zLtDG23tg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I89iHWy+X/ckU9rGG7SRz4GBOBB5vzEf2XTYgxcobZHaYNxnL55SLKJtMvycOTV8MKo1MlivSF+mSeUcUnj9sYXmjbPRQjh81Ds/mJU2lfVG77I52hV5uSc4hNTWtzURkoRv15raveyoa31wHn41KIMG/k8lw/WTpjbXOj6JvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=PyBlv3iJ; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="PyBlv3iJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UIdVnNJSlrdN/ogBMzjqJdURidk/0O2I0Sqfpx7mr7k=; b=PyBlv3iJrSscFR4dBdCULuy/v3
	HXc0CADvC4HzyWuCelZMrRis5Ub8/wU2gWFjZlDKrZxT6DMgOtkDlyzwLlW0LdAk2sy+0+wrZ2mMV
	vfpNF9X2YwfuY7w3YdRM9g44+vJIsbs12GsOi8UB0g9U/57o3aKID5W5zUGwXIAqGNtNpuy4rDYrp
	UwivnJgEZre0hUL9f0L6L6kyeXxKcGio9jon/bxuvJyYbUJ5qVw5ZR0M78YhXkDInHXqVi3n/yFf4
	ilEksGwnNsieNDe7TOLAI4rtqDiCCvVWbncYQRERGX4MiFNastbRWn75dZw2BYwYnHmOMd1Orc09w
	8wZttabw==;
Received: from [89.212.21.243] (port=52296 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tIQeR-00Bd83-2F;
	Tue, 03 Dec 2024 12:01:07 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 0/3] SN65DSI83/4 lvds_vod_swing properties
Date: Tue,  3 Dec 2024 12:00:51 +0100
Message-Id: <20241203110054.2506123-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi all,

this is a v3, which has only a minor change in a second patch.

The LVDS differential voltage swing can be specified as arrays of min, max
in microvolts. Two arrays, one for data-lanes and one for clock-lane can
be specified. Additionally, because LVDS voltage swing depends on near-end
termination this can now also be specified with separate property.

Driver goes through the tables, taken from datasheet [1] and selects the
appropriate configuration. If appropriate configuration can not be found
the probe fails. If these properties are not defined default values are
used as before.

This patch series depends on the patch
"[PATCH v2 11/15] arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10"
(https://lore.kernel.org/all/20241202072052.2195283-12-andrej.picej@norik.com/)
which is currently under review. Please apply the dependent series first before
applying this one.

v1 is at: https://lore.kernel.org/all/20241127103031.1007893-1-andrej.picej@norik.com/
v2 is at: https://lore.kernel.org/all/20241203085822.2475138-1-andrej.picej@norik.com/

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F

Best regards,
Andrej

Andrej Picej (3):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for
    ti,lvds-vod-swing
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  36 ++++-
 .../imx8mm-phyboard-polis-peb-av-10.dtso      |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 144 +++++++++++++++++-
 3 files changed, 176 insertions(+), 6 deletions(-)

-- 
2.34.1

