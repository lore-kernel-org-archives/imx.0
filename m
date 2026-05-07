Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE8175A86;
	Thu,  7 May 2026 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778119491; cv=none; b=F/QMZ3+VtMz58BFhDwx8v/wLg4TKRGvrugObGMjAIwoMd8zXIdA1rUzHH4UDX1A8LIt8Evmb1ssWKyIzExdBKB8drNbLLlpFCgH7v9NQfoc0z1DscFENu1IqQEbOJcnPWGrHzb4Ke6QLcj3kvOBp0ncm2eIWHrlofrbNEnICLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778119491; c=relaxed/simple;
	bh=lJaPl6wOkqhsTploYJf4mteKnlkNNmPvzmK4PbvTbi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NsDMXJdBrY/AcnTCXC11dD/e1yHoINcTkq9KUwm71oiM+ZSVoYVfvF5+FbwBxbnS+a1twLPPZmylljrONEBVNVR48+rR39D+YllgfDaP6rATVDCW5t9Lm4D/UMxzdq9qOWxNDbytiOz8dN46ylJn+JnPoPg+vYgrx0gjBscqsEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3+TDMIYV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3+TDMIYV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RbAsRYzAkCbJ1/8T3LbEArGRD0sXdZFrfoEMs73jHT0=; b=3+TDMIYVwQY4iPvzZQLKA7WVZU
	lt4HSMM4iAIAjTKZTlUS8jmS047sVU3b0F7Md5hMeU3jJsst5fVkSBmGaLJB8akxU/PM3+mSaM/8p
	hOfXjaCm4c0IqCnPRTbvTqhw4b2V4otAawlwC0s1wFFEC1bYePWWbtvYndsUzQxYqe0rOj2g46cld
	59GdYa4G8Rl4j5Mi4BetgCyhRjZTIs6Ruj7DZsBgB32PARrbK9m16CJU5nKH2BQqAqrxyXx+4R30G
	Uxm2QzOukXjjMmVKEqIDjWpiFpyy9gqkYM9tSb5uOAvzsgsfzM+5+vRmn4gs0mG3wcQjpuc7x/gjs
	/NlA/xyw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKo6Y-00000002UE6-3oXD;
	Thu, 07 May 2026 02:04:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/firmware: clean up other_interfaces.rst
Date: Wed,  6 May 2026 19:04:46 -0700
Message-ID: <20260507020446.370101-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bullet lists, grammar, punctuation, spelling, and literal block
formatting. These changes eliminate several documentation build warnings
make the documentation more readable, and render it cleanly.

Documentation/driver-api/firmware/other_interfaces.rst:60: ERROR: Unexpected indentation. [docutils]
Documentation/driver-api/firmware/other_interfaces.rst:103: ERROR: Unexpected indentation. [docutils]
Documentation/driver-api/firmware/other_interfaces.rst:115: ERROR: Unexpected indentation. [docutils]
Documentation/driver-api/firmware/other_interfaces.rst:116: WARNING: Blank line required after table. [docutils]
Documentation/driver-api/firmware/other_interfaces.rst:140: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]

Fixes: 3b4531c6e0f4 ("Documentation/firmware: add imx/se to other_interfaces")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/driver-api/firmware/other_interfaces.rst |   40 +++++-----
 1 file changed, 21 insertions(+), 19 deletions(-)

--- linux-next-20260506.orig/Documentation/driver-api/firmware/other_interfaces.rst
+++ linux-next-20260506/Documentation/driver-api/firmware/other_interfaces.rst
@@ -56,12 +56,13 @@ NXP Secure Enclave Firmware Interface
 Introduction
 ------------
 The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
-enclave within the SoC boundary to enable features like
- - Hardware Security Module (HSM)
- - Security Hardware Extension (SHE)
- - Vehicular to Anything (V2X)
+enclave within the SoC boundary to enable features like:
 
-Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
 On a single SoC, multiple hardware IP (or can say more than one secure enclave)
 can exist.
 
@@ -74,25 +75,27 @@ MUs, dedicated to itself. None of the MU
 of the MU is realized using the mailbox driver. Each secure enclave can cater to
 multiple clients by virtue of these exclusive MUs. Also, they can distinguish
 transactions originating from these clients based on the MU used and core security
-state. The communication between the clients and secure enclaves is in form of
-command/response mechanism. Each client could expose specific set of secure enclave
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
 features to the higher layers, based on the commands supported by that client. For
 example, the secure enclave could simultaneously support an OPTEE TA and Linux
-middleware as clients. Each of these clients can expose specific set of secure
+middleware as clients. Each of these clients can expose a specific set of secure
 enclave features based on the command set supported by them.
 
 NXP Secure Enclave(SE) Interface
 --------------------------------
-Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
-multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
 that is/are dedicated to a particular SE will be enumerated and provisioned using the
 single compatible node("fsl,imx95-se").
 
-Each 'se-if' comprise of twp layers:
+Each 'se-if' comprises two layers:
+
 - (C_DEV Layer) User-Space software-access interface.
 - (Service Layer) OS-level software-access interface.
 
 ::
+
    +--------------------------------------------+
    |            Character Device(C_DEV)         |
    |                                            |
@@ -124,20 +127,19 @@ Each 'se-if' comprise of twp layers:
   for communication with firmware.
 
   FW Communication protocol ensures two things:
-  - Serializing the messages to be sent over an MU.
 
+  - Serializing the messages to be sent over an MU.
   - FW can handle one command message at a time.
 
 - c_dev:
   This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
-  Using these multiple device contexts that are getting multiplexed over a single MU,
+  Using these multiple device contexts that are multiplexed over a single MU,
   userspace application(s) can call fops like write/read to send the command message,
   and read back the command response message to/from Firmware.
   fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.
 
-  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
-::
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
 
                                 Non-Secure               +   Secure
                                                          |
@@ -163,11 +165,11 @@ Each 'se-if' comprise of twp layers:
                 User 0        User 1       User Y        |
                 +------+      +------+     +------+      |
                 |misc.c|      |misc.c|     |misc.c|      |
- kernel space   +------+      +------+     +------+      |
+   kernel space +------+      +------+     +------+      |
                                                          |
- +------------------------------------------------------ |
+   +---------------------------------------------------- |
                     |             |           |          |
- userspace     /dev/ele_muXch0    |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
                           /dev/ele_muXch1     |          |
                                         /dev/ele_muXchY  |
                                                          |
@@ -175,7 +177,7 @@ Each 'se-if' comprise of twp layers:
 When a user sends a command to the firmware, it registers its device_ctx
 as waiter of a response from firmware.
 
-Enclave's Firmware owns the storage management, over Linux filesystem.
+Enclave's Firmware owns the storage management over a Linux filesystem.
 For this c_dev provisions a dedicated slave device called "receiver".
 
 .. kernel-doc:: drivers/firmware/imx/se_ctrl.c
