Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409B222565
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784465773; cv=none; b=lang1FQ5ElEwOsqT+CNjC7T5X845tbTNyJUhhBYkJtsh2cRxZ1OOD++irNcGZg/NelS0/ZTdJcBKm5QQTxfI2jhi+s5iZu3lc2BpryNEG1o6Nu6/n11NGF99YLe7eow3qHiESuiESbl74C3aXrWt+dbEarbKda8R6ePuc5rFmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784465773; c=relaxed/simple;
	bh=tbFY6fp4UldEdOFPWG5qshyGEZr0Xdq96AYMiaJs3fE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qcNferwEFTkty5H7J5Wdj66IYpMBCraJpy9HmHa6RxIu2L5Jvqmg7bGHkqgCdx4byImRNrWIb9PrO65fSTOJIAjNlcUdEjPIvIZex4xCAKnMrmU6epzeduE4YMVQPFLLKyQd7P1MG8KOlv+07Tp9qrZP2aIMOQoVRGEzoBH2yWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK+g/5mb; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK+g/5mb"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso103264425ad.3
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465771; x=1785070571; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=;
        b=WK+g/5mb6Rvlgzqv32Rn8kTdWCTBGrzfxNIQd1bnEQJbwHelW3qm4jtB/DOIximrhk
         l/LAniQEhDvRYNa+PJOaczlq/lRmHqipbTpfHefkC7ZJJ9O7eO/7tqxT+StWG6QvDEQ3
         7IE973e/G+Q7Wc2iclIA5oMMo6Wlw4/p9Fndo0lLeUjasykIUqkENT41x+aGGUjOmEuh
         Mdx/kamf8nMxNaCZVUFPk4GNAByMHGEWZaHqnCIslHQBINg1hqVQd+cRHnzl4aLFVv/h
         xmdc9HaNBwnoDPLTo+UUzsnSNfpAy3i5OtDvn1Cy+mIP48qKEI/2kkdPYNjo+KNQdnVw
         XUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465771; x=1785070571;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=;
        b=Fh5ZwmaHn3E4fx5+fJuNGCBNV2bX44ZXvgfGizlBQqyqb/5FOo1Ewrtot6YOtsyN+h
         qJO/xYpSsKX/5tFKAmXl85mJVWWiqCHsWjoBqZzV+6zsfUzYw+Slz4HaFskckZwDlnj4
         ZrcSOadOVrg4NmucPxYREWks3EhGr5IcHjK8Ztu3+4XFiSaPilboZxMfYp/yQqKIZE14
         c+HL460KGpxNyvGM7dXpmESjSKH9PHgEJT9ghMkLRrCOu7JsOB2M85ThbRzuVGh4WKML
         ekoREAzYs+qPcPl1tpRPcr36mRizooAkz4/88eToQbUzy1uUgtCWIsmoaRQA3+/Tw3Ts
         Oq/A==
X-Forwarded-Encrypted: i=1; AHgh+RqhuyJVxlrfN9KLmNcaNH2TKCGWGtUWhoW2Ad0wUWSRoyXcKI3tCtW7euuKhG+7EVHhKlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YygkvVQyclVaVXOWsk3lZCqVYpyOzPAKyjetDjbLxK8yXzBgg/v
	IxSDyG1ggBOToYQXa+CPCSuvzbrORNKKzKYgSxFTbwz2x8ke/TAQKffN
X-Gm-Gg: AfdE7cnK0e9nM06MgzOXgwp/kSTeG2MHcJBAFNveaDhQWDhUAxd/yjst6X2rLOkcbhb
	oGOMveJaK2gTTJcY1dYl+CGpZ3qK4Iz/bfqjlaqSHzcdV5gSLSBhXVYwpGBesnD3oZhMcwbp2wQ
	X9s+zo4WAHioCrf3WWj26qdP5Xr6xEGXXgjrLcGmMGRA9PAI2iBrW8E9YkaDch4sEL7uAk4TmZ2
	pqg/s9JzM7lHSk03RH+ErdMzJK6pseHyYgJJIYyPkgZkPgGQuwIlcm3D4CxxE7CQGLywv1st5W+
	zWWXvmS0HJ7XO0tXqn5FXb0aVihOtyJNU1VkReWX2eroGrIt2ub3AcWQCLEiKUpYi6vyQj4H3aG
	MaVBU0bukpKUEhjsGbWKfLBKBwe3Em9+0nP6xfYfOd9mstc6oDlog2euVmVq9Zc9MIYQumXYD5v
	jKDOg=
X-Received: by 2002:a17:902:da81:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2cf34a48064mr112928635ad.32.1784465771134;
        Sun, 19 Jul 2026 05:56:11 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:10 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Subject: [PATCH 0/3] usb: Use %pe to print error pointers
Date: Sun, 19 Jul 2026 18:25:45 +0530
Message-Id: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHJXGoC/x3MQQqEMBAF0atIrw0YGY14FRGJ8c/YGw3dUQTx7
 hNcvkXVTQphKPXFTYKTlfctw5YFhdVvPxhesqmu6rZytjOHziYmmSAyRZ/CqkjGhWaxzcfNgKO
 cRsGXr3c7jM/zB/dGg0dmAAAA
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=1535;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=tbFY6fp4UldEdOFPWG5qshyGEZr0Xdq96AYMiaJs3fE=;
 b=AKmLrPfrqg8Co2eNp1+tUZNc8ZaIcc3Pvtn1ics7ne1WDLCCZGIYXPUI1ATsLWt53k64N9Qzg
 WbSIB/hP1e3CcRt9EbIhunGN2mAKRvXXd16B7GHliBKtoD87uKcy6tp
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

This patchset replaces PTR_ERR() in format strings with 
%pe format specifier across the USB subsystem. %pe prints 
symbolic error names (e.g., -ENOMEM) instead of 
raw numbers (e.g., -12), making error logs more readable. 
These patches fix coccinelle reported warning: "Consider 
using %pe to print PTR_ERR()" in usb subsystem.

The patches are grouped by subsystem:
  1/3 - chipidea
  2/3 - miscellaneous USB drivers
  3/3 - typec

All patches are compile-tested on x86_64. Please let me know if 
any more testing is needed for any patch. 

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
Subasri S (3):
      usb: chipidea: Use %pe to print error pointers
      usb: misc: Use %pe to print error pointers
      usb: typec: Use %pe to print error pointers

 drivers/usb/atm/usbatm.c               |  4 ++--
 drivers/usb/chipidea/ci_hdrc_imx.c     | 12 ++++++------
 drivers/usb/chipidea/core.c            |  4 ++--
 drivers/usb/core/hub.c                 |  4 ++--
 drivers/usb/dwc2/pci.c                 |  4 ++--
 drivers/usb/gadget/function/u_serial.c |  4 ++--
 drivers/usb/misc/usb3503.c             |  4 ++--
 drivers/usb/typec/mux/pi3usb30532.c    |  8 ++++----
 drivers/usb/typec/tcpm/tcpm.c          |  2 +-
 drivers/usb/typec/wusb3801.c           |  4 ++--
 10 files changed, 25 insertions(+), 25 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260718-usb-ptr_err_patchset-7c5d1547bee7

Best regards,
-- 
Subasri S <subasris1210@gmail.com>

