Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB97A927
	for <imx@lists.linux.dev>; Sun,  1 Oct 2023 11:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696159372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2PmJLGZGYM/2RvXfCM4a7iZd7KULTy8GDfhMPfgYLY8=;
	b=ex1yB+qHk2/hfB3xTadxWYwdywavBjzXH5Wf8d/3MAzpNhTqLlSFILYF9oqNg7GwRv/drh
	BzwHxNE3y3RMG2JZ96T9L1L241WSmiKw7S/QwpXwx6LhL1uehUzwZf9feXemrGAzqg39m4
	NxJz9OUoSJ3RMkq2gTM1JdEJomrlHxw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-678-3liq-1YMPcWNLKVRSl48gA-1; Sun, 01 Oct 2023 07:22:38 -0400
X-MC-Unique: 3liq-1YMPcWNLKVRSl48gA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 763E73C02520;
	Sun,  1 Oct 2023 11:22:37 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2FA493113;
	Sun,  1 Oct 2023 11:22:36 +0000 (UTC)
Date: Sun, 1 Oct 2023 19:22:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, gregkh@linuxfoundation.org,
	arnd@arndb.de, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, rafael@kernel.org
Subject: Re: [PATCH 1/1] fs: debugfs: fix build error at powerpc platform
Message-ID: <ZRlWeeq/AOjyTtnV@MiWiFi-R3L-srv>
References: <20230929164920.314849-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929164920.314849-1-Frank.Li@nxp.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

On 09/29/23 at 12:49pm, Frank Li wrote:
>    ld: fs/debugfs/file.o: in function `debugfs_print_regs':
>    file.c:(.text+0x95a): undefined reference to `ioread64be'
> >> ld: file.c:(.text+0x9dd): undefined reference to `ioread64'

From your reproducer, on x86_64, GENERIC_IOMAP is selected. So the
default version of ioread64 and ioread64be in asm-generic/io.h are
bypassed. Except of those arch where ioread64 and ioread64be are
implemented specifically like alpha, arm64, parisc, power, we may need
include include/linux/io-64-nonatomic-hi-lo.h or
include/linux/io-64-nonatomic-lo-hi.h to fix above linking issue?

From my side, below change can fix the issue. However, I am not quite
sure which one is chosen between io-64-nonatomic-hi-lo.h and 
io-64-nonatomic-hi-lo.h.

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 87b3753aa4b1..b433be134c67 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -15,6 +15,7 @@
 #include <linux/pagemap.h>
 #include <linux/debugfs.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
-- 
2.41.0

