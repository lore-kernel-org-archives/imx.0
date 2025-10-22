Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F4280318
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128559; cv=none; b=qGzxWF160qQsLEsQsf2OnjaQHH3WslGxQG6KemqQzx5M4PnPU+ON/dvw3d8ocvvEDa9hBIaQSsk7LXf9l1MQ8HtXEw6nQr09gisTdfhA097XcythPVxxTzGhrqLNho0BFKXwaMiS2RO4dIw9FAJOKfxmnpNV+MsgaLhL2+1FFs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128559; c=relaxed/simple;
	bh=rtHIcIuW+eyTXpw+CzQkcCzTyOn28HLLhV1J/ymOUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YFAgxd2vtD2yjtuqeOD5DQfiZH6FCK6jU1Sp0QBaCqtPdTTsipxKMeRvR7yT0kab92QKuH7OdxaZvK3ka4i4QQS8akNmfFtmsvm4vMKdDeaMsmkmU/s+LBku6n2nXDtaVs/OgkQuOUUVuJ68elKgJ5sMqBOXXMleT4wlGtkZtdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CCl1vRPU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CCl1vRPU"
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63CB5605;
	Wed, 22 Oct 2025 12:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128450;
	bh=rtHIcIuW+eyTXpw+CzQkcCzTyOn28HLLhV1J/ymOUHs=;
	h=From:To:Cc:Subject:Date:From;
	b=CCl1vRPU79fsJ6iCm3SmhgVG26BRv0dwyjX6kONis4hViy8tSXwdjErAmtHDLwc2Q
	 qRqhUQdarbMrqEQQs0X44jlmN7KcoPoqxkrkrWPosDutvycRhiynysLCv0meeGpWZX
	 cP8evIncqijhPqwDYhJgYJFzwHWnTev1eXZlHahw=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 0/4] media: imx-mipi-csis: Get the number of active lanes from mbus_config
Date: Wed, 22 Oct 2025 11:22:24 +0100
Message-ID: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that the number of desired active MIPI CSI2 data lanes
does not match the maximum listed in device tree. Add a helper function
to v4l2_common that calls the get_mbus_config op to get the number of
actively used data lanes in drivers that support it.

Compare it to the number of lanes configured in device tree, and if its
invalid, use the number present in device tree.

This series also uses the helper in imx-mipi-csis driver to set the
currently configured num_data_lanes, while keeping track of the number
of data lanes set in device tree to ensure we can still use all possible
lanes if we need to, and the upstream subdev driver requests them.

Tested on v6.17.2, compile tested on media/next.

---------

Changes v4 -> v5:

- Collected tag for patch 2/4
- Updated commit messages on 3/4 and 4/4

Changes v3 -> v4:

- Updated base tree to media/next
- Used local 'lanes' variable consistently in
  v4l2_get_active_data_lanes()
- Removed device tree references in documentation
- Made comment a single line
- Collected tag for patch 1/4
- Removed unnecessary num_data_lanes assignments in async_register in
  imx-mipi-csis
- Removed some debug print changes
- Checked return value of v4l2_get_active_data_lanes() before assignment
  to csis->num_data_lanes
- Added patch to move redundant debug print in mipi_csis_probe()

Changes v2 -> v3:

- Rename dt_lanes to max_data_lanes
- Remove check for < 0 on unsigned int max_data_lanes in
  v4l2_get_active_data_lanes()
- Added comment to explain that mbus_config is expected to be zeroed at
  init in drivers implementing get_mbus_config subdev pad op
- Wrapped signature in header file and source for
  v4l2_get_active_data_lanes()
- Added kernel-doc documentation for v4l2_get_active_data_lanes()
- Added debug message to indicate an invalid number of active lanes
- Changed csis->max_data_lanes to csis->num_data_lanes
- Changed uses of csis->bus.num_data_lanes to csis->num_data_lanes where
  appropriate to make csis->bus immutable after probe

Changes v1 -> v2:

- Added helper function to get active data lanes in v4l2-common
- Store the maximum data lanes possible, as configured in device tree
- Added media: prefix to commit titles

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
Isaac Scott (4):
  media: v4l: Add helper to get number of active lanes via a pad
  media: imx-mipi-csis: Move redundant debug print in probe
  media: imx-mipi-csis: Add num_data_lanes to mipi_csis_device
  media: imx-mipi-csis: Support active data lanes differing from maximum

 drivers/media/platform/nxp/imx-mipi-csis.c | 19 ++++++++------
 drivers/media/v4l2-core/v4l2-common.c      | 29 ++++++++++++++++++++++
 include/media/v4l2-common.h                | 20 +++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)

-- 
2.43.0

